import { Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User, UserDocument } from './schema/user.schema';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcryptjs';
@Injectable()
export class UserService {
  private users = [
    { email: 'test@example.com', password: '123456' },
    { email: 'sinan@gmail.com', password: 'password' },
  ];

  async login(UserData: any): Promise<any> {
    const { email, password } = UserData;
    const user = this.users.find(
      u => u.email === email && u.password === password,
    );
    if (user) {
      return { message: 'Login successful', user };
    } else {
      return { message: 'Invalid credentials' };
    }
  }

  async create(UserData: any): Promise<any> {
    this.users.push(UserData);
    return { message: 'User created', user: UserData };
  }

  async findAll(): Promise<any[]> {
    return this.users;
  }
}
