import { Controller, Post, Body } from '@nestjs/common';
import { AssessmentService } from '../assessment/assessment.services';

@Controller('api/assessment')
export class AssessmentController {
  constructor(private readonly assessmentService: AssessmentService) {}

  @Post()
  async generate(@Body() body: any) {
    const { userId, ...userData } = body;
    const assessment = await this.assessmentService.generateAssessment(userId, );
    return { assessment };
  }
}
