import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/assesment_time_card.dart';
import 'package:mentorly/view/widgets/button.dart';
import 'package:mentorly/view/widgets/style/colors.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    final isTablet = screenWidth > 600;
    final isSmallScreen = screenWidth < 360;

    
    final titleSize =
        isTablet
            ? 28.0
            : isSmallScreen
            ? 20.0
            : 24.0;
    final subtitleSize =
        isTablet
            ? 18.0
            : isSmallScreen
            ? 14.0
            : 16.0;
    final cardPadding = isTablet ? 24.0 : 16.0;
    final containerMaxWidth = isTablet ? 500.0 : screenWidth * 0.9;

    final availableWidth = containerMaxWidth - (cardPadding * 2);
    final cardWidth = (availableWidth - cardPadding) / 2;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 400,
            width: containerMaxWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/brain.png',
                      height: 50,
                      width: 50,
                      color: Colors.blue,
                    ),
                    Text(
                      "Mathematics Quiz",
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(cardPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AssessmentCard(
                        number: "3",
                        label: "Questions",
                        width: cardWidth,
                        height: isTablet ? 120 : 100,
                        isTablet: isTablet,
                        isSmallScreen: isSmallScreen,
                      ),
                      AssessmentCard(
                        number: "5",
                        label: "Minutes",
                        width: cardWidth,
                        height: isTablet ? 120 : 100,
                        isTablet: isTablet,
                        isSmallScreen: isSmallScreen,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Topics Covered",
                    style: TextStyle(
                      fontSize: subtitleSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: cardPadding),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children:
                        ["Algebra", "Geometry", "Trigonometry"].map((subject) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              subject,
                              style: TextStyle(
                                fontSize: subtitleSize,
                                color: Colors.grey[700],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
                // const Spacer(),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: MyButton(
                      text: "Start Quiz",
                      color: blue,
                      textColor: Colors.white,
                      height: 50,
                      width: 300,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
