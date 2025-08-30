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
        
        double buttonWidth;
        
        if (shouldStackVertically) {
          // For vertical stack, use 80% of available width
          buttonWidth = constraints.maxWidth * 0.8;
        } else {
          // For horizontal row, use 40% of available width for each button
          buttonWidth = constraints.maxWidth * 0.4;
        }
        
        // Clamp to slightly larger range for better button width
        buttonWidth = buttonWidth.clamp(130.0, 220.0);
        
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Center the buttons with equal spacing
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
            const SizedBox(width: 15),
            MyButton(
              text: "Ask AI",
              color: backgroundColor,
              textColor: Colors.black,
              height: 80,
              width: buttonWidth,
              image: 'assets/book.png',
              fontSize: 12,
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}