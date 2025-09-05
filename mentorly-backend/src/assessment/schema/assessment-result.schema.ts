import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document, Types } from 'mongoose';

export type AssessmentResultDocument = AssessmentResult & Document;

@Schema({ timestamps: true })
export class AssessmentResult {
  @Prop({ type: Types.ObjectId, ref: 'User', required: true })
  userId: Types.ObjectId;

  @Prop({ type: Array, required: true })
  questions: any[];

  @Prop({ type: Array, required: true })
  userAnswers: { questionId: number; selectedAnswer: string }[];

  @Prop({ type: Number, required: true })
  score: number;

  @Prop({ type: Number, required: true })
  totalQuestions: number;

  @Prop({ type: Number, required: true })
  timeSpent: number;

  @Prop({ type: Object })
  evaluation: any;

  @Prop({ type: String, enum: ['completed', 'incomplete'], default: 'completed' })
  status: string;
}

export const AssessmentResultSchema = SchemaFactory.createForClass(AssessmentResult);