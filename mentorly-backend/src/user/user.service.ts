import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User, UserDocument } from './schema/user.schema';
import { error } from 'console';
// import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcryptjs';
import {
  Injectable,
  InternalServerErrorException,
  NotFoundException,
} from '@nestjs/common';

@Injectable()
export class UserService {
  constructor(
    @InjectModel(User.name)
    private readonly userModel: Model<UserDocument>
  ) { }


  async login(userData: any): Promise<any> {
    try {
      const { email, password } = userData;
      const user = await this.userModel.findOne({ email, password });

      if (!user) {
        throw new NotFoundException('Invalid email or password');
      }

      return { message: 'Login Successful', user };
    } catch (e) {
      if (e instanceof NotFoundException) {
        throw e;
      }
      throw new InternalServerErrorException(e.message);
    }
  }

  async create(userData: any): Promise<any> {
    const existingUser = await this.userModel.findOne({ email: userData.email });
    if (existingUser) {
      throw new Error('User already exists');
    }

    const hashedPassword = await bcrypt.hash(userData.password, 10);
    const createdUser = new this.userModel({ ...userData, password: hashedPassword, });
    const savedUser = await createdUser.save();

    return {
      message: 'User created successfully',
      user: {
        id: savedUser._id,
        name: savedUser.name,
        email: savedUser.email,
        medium: savedUser.medium,
        syllabus: savedUser.syllabus,
        strongSubjects: savedUser.strongSubjects,
        weakSubjects: savedUser.weakSubjects,
      },
    };
  }
}
