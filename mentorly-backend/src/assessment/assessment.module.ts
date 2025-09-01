import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { AssessmentService } from '../assessment/assessment.services';
import { AssessmentController } from '../assessment/assessment.controller';
import { User, UserSchema } from '../user/schema/user.schema';

@Module({
  imports: [MongooseModule.forFeature([{ name: User.name, schema: UserSchema }])],
  controllers: [AssessmentController],
  providers: [AssessmentService],
})
export class AssessmentModule {}
