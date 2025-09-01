import { Injectable } from '@nestjs/common';
import OpenAI from 'openai';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User, UserDocument } from '../user/schema/user.schema';

@Injectable()
export class AssessmentService {
  private openai: OpenAI;

  constructor(
    @InjectModel(User.name) private userModel: Model<UserDocument>,
  ) {
    this.openai = new OpenAI({
      apiKey: process.env.OPENAI_API_KEY,
    });
  }

  async generateAssessment(userId: string): Promise<string> {

  const user = await this.userModel.findById(userId);

  if (!user) return 'User not found';

  const prompt = `
Generate a personalized assessment for the student:
- Name: ${user.name}
- Syllabus: ${user.syllabus}
- Strong Subjects: ${user.strongSubjects.join(', ')}
- Weak Subjects: ${user.weakSubjects.join(', ')}

Rules:
1. Mention 3 strengths and 3 areas for improvement.
2. Suggest a simple study plan for weak subjects.
3. Keep it concise (max 150 words).
`;

  const completion = await this.openai.chat.completions.create({
    model: 'gpt-4',
    messages: [
      { role: 'system', content: 'You are an expert CBSE tutor providing structured, encouraging assessments.' },
      { role: 'user', content: prompt },
    ],
    temperature: 0.7,
    max_tokens: 400,
  });

  return completion.choices[0].message?.content || 'No assessment generated';
}

}