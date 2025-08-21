import { Controller, Post, Body } from '@nestjs/common';
import { UserService } from './user.service';

@Controller('api/user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Post()
  login(@Body() body: any) {
    return this.userService.login(body);
  }
   @Post('register')
  register(@Body() body: any) {
    return this.userService.create(body);
  }
}
