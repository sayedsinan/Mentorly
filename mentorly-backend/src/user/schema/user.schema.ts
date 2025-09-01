import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type UserDocument = User & Document;

@Schema()
@Schema({ timestamps: true }) 
export class User {
  @Prop({ required: true })
  name: string;

  @Prop({ required: true, unique: true })
  email: string;

  @Prop({ required: true })
  password: string;

  @Prop({ required: true })
  medium: string;

  @Prop({ required: true })
  syllabus: string;

  @Prop({ required: true })
  strongSubjects: string[];

  @Prop({ required: true })
  weakSubjects: string[];
  

}

export const UserSchema = SchemaFactory.createForClass(User);
