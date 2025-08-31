import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
 await app.listen(3000, '0.0.0.0');

 app.enableCors({
    origin: 'http://localhost:49686', // or '*'
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true,
  });
  console.log(`Application is running on: ${await app.getUrl()}`);
console.log(`Environment: ${process.env.NODE_ENV || 'development'}`);
}

bootstrap();
