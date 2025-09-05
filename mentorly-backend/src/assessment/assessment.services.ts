import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User, UserDocument } from '../user/schema/user.schema';
import { AssessmentResult, AssessmentResultDocument } from './schema/assessment-result.schema';
import OpenAI from 'openai';

interface Question {
  id: number;
  subject: string;
  difficulty: 'easy' | 'medium' | 'hard';
  question: string;
  options: string[];
  correctAnswer: string;
  explanation: string;
  timeAllocation: number;
}

interface AssessmentTest {
  userId: string;
  questions: Question[];
  totalDuration: number;
  instructions: string;
  createdAt: Date;
}

interface DetailedResult {
  questionId: number;
  subject: string;
  isCorrect: boolean;
  userAnswer: string;
  correctAnswer: string;
  explanation: string;
}

export interface EvaluationResult {
  score: number;
  totalQuestions: number;
  correctAnswers: number;
  detailedResults: DetailedResult[];
  aiFeedback: any;
  assessmentId?: string;
}

@Injectable()
export class AssessmentService {
  private openai: OpenAI;

  constructor(
    @InjectModel(User.name) private userModel: Model<UserDocument>,
    @InjectModel(AssessmentResult.name) private assessmentResultModel: Model<AssessmentResultDocument>,
  ) {
    this.openai = new OpenAI({
      apiKey:'', // store in .env
    });

  
  }

  private async queryOpenAI(prompt: string): Promise<string> {
    const completion = await this.openai.chat.completions.create({
      model: 'gpt-4o-mini', // you can also use "gpt-3.5-turbo"
      messages: [
        { role: 'system', content: 'You are an AI that generates structured JSON responses only.' },
        { role: 'user', content: prompt },
      ],
      temperature: 0.7,
    });

    const output = completion.choices[0]?.message?.content?.trim();
    if (!output) throw new Error('No response from OpenAI');
    return output;
  }

  async generateAssessmentTest(userId: string): Promise<AssessmentTest | string> {
    const user = await this.userModel.findById(userId);
    if (!user) return 'User not found';

    const prompt = `
Generate a personalized 10-minute assessment test for a ${user.medium} standard student following ${user.syllabus} curriculum.

Student Details:
- Name: ${user.name}
- Standard: ${user.medium}
- Board: ${user.syllabus}
- Strong Subjects: ${user.strongSubjects.join(', ')}
- Weak Subjects: ${user.weakSubjects.join(', ')}

Requirements:
1. Create exactly 5 multiple-choice questions
2. 2 questions from STRONG subjects (medium difficulty)
3. 3 questions from WEAK subjects (easy to medium difficulty)
4. Each question should have 4 options (A, B, C, D)
5. Time allocation: 10 minutes for the whole quiz
6. Questions should be age-appropriate for ${user.medium} standard
7. Focus on fundamental concepts

Respond with ONLY a JSON object like this:
{
  "questions": [
    {
      "id": 1,
      "subject": "Math",
      "difficulty": "easy",
      "question": "What is 2+2?",
      "options": ["A) 2", "B) 3", "C) 4", "D) 5"],
      "correctAnswer": "C",
      "explanation": "2+2 = 4",
      "timeAllocation": 2
    }
  ],
  "instructions": "Answer all questions. You have 2 minutes per question."
}`;

    try {
      const output = await this.queryOpenAI(prompt);
      const parsed = JSON.parse(output);

      return {
        userId,
        questions: parsed.questions,
        totalDuration: 10,
        instructions: parsed.instructions,
        createdAt: new Date(),
      };
    } catch (error) {
      console.error('Error generating assessment:', error);
      return this.getFallbackAssessment(user, userId);
    }
  }

  private getFallbackAssessment(user: any, userId: string): AssessmentTest {
    return {
      userId,
      totalDuration: 10,
      createdAt: new Date(),
      instructions: 'Fallback test. Answer all questions.',
      questions: [
        {
          id: 1,
          subject: 'Math',
          difficulty: 'easy',
          question: 'What is 10 + 5?',
          options: ['A) 12', 'B) 13', 'C) 14', 'D) 15'],
          correctAnswer: 'D',
          explanation: '10 + 5 = 15',
          timeAllocation: 2,
        },
      ],
    };
  }

  async evaluateAssessment(
    userId: string,
    userAnswers: { questionId: number; selectedAnswer: string }[],
    originalQuestions: Question[],
  ): Promise<EvaluationResult | string> {
    const user = await this.userModel.findById(userId);
    if (!user) return 'User not found';

    let correctAnswers = 0;
    const detailedResults: DetailedResult[] = [];

    for (const answer of userAnswers) {
      const q = originalQuestions.find(q => q.id === answer.questionId);
      if (q) {
        const isCorrect = q.correctAnswer === answer.selectedAnswer;
        if (isCorrect) correctAnswers++;
        detailedResults.push({
          questionId: q.id,
          subject: q.subject,
          isCorrect,
          userAnswer: answer.selectedAnswer,
          correctAnswer: q.correctAnswer,
          explanation: q.explanation,
        });
      }
    }

    const score = Math.round((correctAnswers / originalQuestions.length) * 100);

    const assessmentResult = new this.assessmentResultModel({
      userId,
      questions: originalQuestions,
      userAnswers,
      score,
      totalQuestions: originalQuestions.length,
      evaluation: detailedResults,
      status: 'completed',
    });
    await assessmentResult.save();

    try {
      const feedbackPrompt = `
Student: ${user.name}, Score: ${score}% (${correctAnswers}/${originalQuestions.length})

Give feedback in JSON:
{
  "overallPerformance": "short summary",
  "strengths": ["strength 1", "strength 2"],
  "areasForImprovement": ["area 1"],
  "studyRecommendations": ["recommendation 1"],
  "nextSteps": ["step 1"]
}`;

      const feedbackText = await this.queryOpenAI(feedbackPrompt);
      const aiFeedback = JSON.parse(feedbackText);

      return {
        score,
        totalQuestions: originalQuestions.length,
        correctAnswers,
        detailedResults,
        aiFeedback,
        assessmentId: (assessmentResult._id as any).toString(),
      };
    } catch (error) {
      console.error('Error generating feedback:', error);
      return {
        score,
        totalQuestions: originalQuestions.length,
        correctAnswers,
        detailedResults,
        aiFeedback: { overallPerformance: 'Good effort!' },
        assessmentId: (assessmentResult._id as any).toString(),
      };
    }
  }
}
