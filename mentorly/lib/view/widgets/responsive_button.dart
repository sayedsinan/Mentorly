import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/button.dart';

class ResponsiveButtonRow extends StatelessWidget {
  final Color blue;
  final Color backgroundColor;
  
  const ResponsiveButtonRow({
    Key? key,
    required this.blue,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
     
        bool shouldStackVertically = constraints.maxWidth < 450;
        
      
        double buttonWidth = shouldStackVertically 
            ? constraints.maxWidth 
            : (constraints.maxWidth - 15) / 2; 
        
   
        buttonWidth = buttonWidth.clamp(150.0, 300.0);
        
        if (shouldStackVertically) {
          return Column(
            children: [
              MyButton(
                text: "Take a Quiz",
                color: blue,
                textColor: Colors.white,
                height: 80,
                width: buttonWidth,
                image: 'assets/book.png',
                fontSize: 12,
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              MyButton(
                text: "Ask AI",
                color: backgroundColor,
                textColor: Colors.black,
                height: 80,
                fontSize: 12,
                width: buttonWidth,
                image: 'assets/book.png',
                onPressed: () {},
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              child: MyButton(
                text: "Take a Quiz",
                color: blue,
                textColor: Colors.white,
                height: 80,
                width: buttonWidth,
                image: 'assets/book.png',
                fontSize: 12,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: MyButton(
                text: "Ask AI",
                color: backgroundColor,
                textColor: Colors.black,
                height: 80,
                width: buttonWidth,
                image: 'assets/book.png',
                fontSize: 12,
                onPressed: () {},
              ),
            ),
          ],
        );
      },
    );
  }
}
