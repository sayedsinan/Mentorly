import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
 await app.listen(3000, '0.0.0.0');

 app.enableCors({
   origin: '*',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true,
  });
  console.log(`Application is running on: ${await app.getUrl()}`);
console.log(`Environment: ${process.env.NODE_ENV || 'development'}`);
}

bootstrap();
