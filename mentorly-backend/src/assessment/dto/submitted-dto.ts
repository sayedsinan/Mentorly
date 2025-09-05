import { IsArray, IsNumber, IsString, ValidateNested } from 'class-validator';
import { Type } from 'class-transformer';

export class AnswerDto {
  @IsNumber()
  questionId: number;

  @IsString()
  selectedAnswer: string; // A, B, C, or D
}

export class SubmitAssessmentDto {
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => AnswerDto)
  answers: AnswerDto[];

  @IsNumber()
  timeSpent: number; // in minutes

  // Temporary solution - in production, store questions in Redis/DB
  @IsArray()
  originalQuestions: any[];
}