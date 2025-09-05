import { Controller, Post, Body, Param, Get, HttpException, HttpStatus } from '@nestjs/common';
import { AssessmentService, EvaluationResult } from './assessment.services';
import { SubmitAssessmentDto } from './dto/submitted-dto';

@Controller('assessment')
export class AssessmentController {
  constructor(private readonly assessmentService: AssessmentService) {}

  @Post('generate/:userId')
  async generateTest(@Param('userId') userId: string) {
    try {
      const result = await this.assessmentService.generateAssessmentTest(userId);
      
      if (typeof result === 'string') {
        throw new HttpException(result, HttpStatus.BAD_REQUEST);
      }
    
      const testForFrontend = {
        ...result,
        questions: result.questions.map(q => ({
          id: q.id,
          subject: q.subject,
          difficulty: q.difficulty,
          question: q.question,
          options: q.options,
          timeAllocation: q.timeAllocation,
        })),
      };
      
      return {
        success: true,
        message: 'Assessment test generated successfully',
        data: testForFrontend,
      };
    } catch (error) {
      throw new HttpException('Failed to generate assessment test', HttpStatus.INTERNAL_SERVER_ERROR);
    }
  }

  @Post('submit/:userId')
  async submitAssessment(
    @Param('userId') userId: string,
    @Body() submitData: SubmitAssessmentDto,
  ): Promise<
    | {
        success: true;
        message: string;
        data: EvaluationResult;
      }
    | never
  > {
    try {
      // Note: In a real app, you'd retrieve the original questions from a temporary store or database
      // For now, you need to modify this to handle question retrieval properly
      
      const evaluation = await this.assessmentService.evaluateAssessment(
        userId,
        submitData.answers,
        submitData.originalQuestions // You'll need to pass this from frontend
      );
      
      if (typeof evaluation === 'string') {
        throw new HttpException(evaluation, HttpStatus.BAD_REQUEST);
      }
      
      return {
        success: true,
        message: 'Assessment submitted successfully',
        data: evaluation,
      };
    } catch (error) {
      throw new HttpException('Failed to submit assessment', HttpStatus.INTERNAL_SERVER_ERROR);
    }
  }
}