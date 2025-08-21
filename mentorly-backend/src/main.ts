import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
 await app.listen(3000, 'localhost');

  console.log(`Application is running on: ${await app.getUrl()}`);
console.log(`Environment: ${process.env.NODE_ENV || 'development'}`);
}

bootstrap();
