import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorly/controller/assesment_controller.dart';
import 'package:mentorly/controller/services/ai_controller.dart';
import 'package:mentorly/controller/services/auth_controller.dart';
import 'package:mentorly/controller/text_controller.dart';
import 'package:mentorly/model/register_model.dart';
import 'package:mentorly/view/assesment_test.dart';
import 'package:mentorly/view/widgets/assesment_time_card.dart';
import 'package:mentorly/view/widgets/my_button.dart';
import 'package:mentorly/view/widgets/style/colors.dart';

class IntialAssesment extends StatelessWidget {
  const IntialAssesment({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;
    final isSmallScreen = screenWidth < 360;
    final controller = Get.find<AiController>();
    final AuthController authController = Get.find<AuthController>();
    final TextControllers textControllers = Get.find<TextControllers>();
    final iconSize =
        isTablet
            ? 80.0
            : isSmallScreen
            ? 50.0
            : 60.0;
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
    final AssessmentController assessmentController =
        Get.find<AssessmentController>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: screenHeight * 0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Container(
                    height: iconSize,
                    width: iconSize,
                    decoration: BoxDecoration(
                      color: purple,
                      borderRadius: BorderRadius.circular(
                        isTablet ? 15.0 : 10.0,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/brain.png',
                        height: iconSize * 0.8,
                        width: iconSize * 0.8,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.psychology,
                            size: iconSize * 0.6,
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Initial Assessment",
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                    ),
                    child: Text(
                      "Let's understand your current knowledge level",
                      style: TextStyle(
                        fontSize: subtitleSize,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Container(
                    width: containerMaxWidth,
                    constraints: BoxConstraints(
                      maxWidth: 500,
                      minHeight: isTablet ? 400 : 300,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        isTablet ? 15.0 : 10.0,
                      ),
                      border: Border.all(color: Colors.grey.shade300),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(cardPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/target.png',
                                width:
                                    isTablet
                                        ? 70
                                        : isSmallScreen
                                        ? 50
                                        : 60,
                                height:
                                    isTablet
                                        ? 70
                                        : isSmallScreen
                                        ? 50
                                        : 60,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.gps_fixed,
                                    size:
                                        isTablet
                                            ? 70
                                            : isSmallScreen
                                            ? 50
                                            : 60,
                                    color: purple,
                                  );
                                },
                              ),
                              SizedBox(width: cardPadding * 0.5),
                              Expanded(
                                child: Text(
                                  'Assessment Overview',
                                  style: TextStyle(
                                    fontSize:
                                        isTablet
                                            ? 24
                                            : isSmallScreen
                                            ? 18
                                            : 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: cardPadding),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final availableWidth = constraints.maxWidth;
                              final cardWidth =
                                  (availableWidth - cardPadding) / 2;
                              final shouldStack = cardWidth < 140;

                              if (shouldStack) {
                                return Column(
                                  children: [
                                    AssessmentCard(
                                      number: "5",
                                      label: "Questions",
                                      width: availableWidth * 0.8,
                                      height: isTablet ? 120 : 100,
                                      isTablet: isTablet,
                                      isSmallScreen: isSmallScreen,
                                    ),
                                    SizedBox(height: cardPadding * 0.5),
                                    AssessmentCard(
                                      number: "10",
                                      label: "Minutes",
                                      width: availableWidth * 0.8,
                                      height: isTablet ? 120 : 100,
                                      isTablet: isTablet,
                                      isSmallScreen: isSmallScreen,
                                    ),
                                    SizedBox(height: cardPadding * 0.5),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "What to Expect",
                                          style: TextStyle(
                                            fontSize: isTablet ? 20 : 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "• Questions from your selected subjects",
                                        ),
                                        Text(
                                          "• Mix of easy, medium, and hard questions",
                                        ),
                                        Text(
                                          "• Results will personalize your learning plan",
                                        ),
                                        Text(
                                          "• No pressure - this helps us help you better!",
                                        ),

                                        SizedBox(height: 8),
                                      ],
                                    ),
                                    MyButton(
                                      height: 50,
                                      width: 400,
                                      borderRadius: 10,
                                      buttonColor: purple,
                                      textColor: backgroundColor,
                                      text: "Start Assesment",
                                      style: TextStyle(),
                                      onTap: () {
                                        assessmentController.startTimer();
                                        controller.sendPrompt(
                                          RegisterModel(
                                            email:textControllers .signupEmail.text,
                                            password:
                                                textControllers
                                                    .signupPasword
                                                    .text,
                                            fullName:
                                                textControllers.fullName.text,
                                            medium:
                                                authController
                                                    .selectedGrade
                                                    .value,
                                            board:
                                                authController
                                                    .selectedSyllabus
                                                    .value,
                                            strongSubjects:
                                                authController.strongSubjects,
                                            weakSubjects:
                                                authController.weakSubjects,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AssessmentCard(
                                          number: "5",
                                          label: "Questions",
                                          width: cardWidth,
                                          height: isTablet ? 120 : 100,
                                          isTablet: isTablet,
                                          isSmallScreen: isSmallScreen,
                                        ),
                                        AssessmentCard(
                                          number: "10",
                                          label: "Minutes",
                                          width: cardWidth,
                                          height: isTablet ? 120 : 100,
                                          isTablet: isTablet,
                                          isSmallScreen: isSmallScreen,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: cardPadding * 0.7),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "What to Expect",
                                          style: TextStyle(
                                            fontSize: isTablet ? 20 : 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "• Questions from your selected subjects",
                                        ),
                                        Text(
                                          "• Mix of easy, medium, and hard questions",
                                        ),
                                        Text(
                                          "• Results will personalize your learning plan",
                                        ),
                                        Text(
                                          "• No pressure - this helps us help you better!",
                                        ),

                                        SizedBox(height: 8),
                                      ],
                                    ),
                                    MyButton(
                                      height: 50,
                                      width: 400,
                                      borderRadius: 10,
                                      buttonColor: purple,
                                      textColor: backgroundColor,
                                      text: "Start Assesment",
                                      style: TextStyle(),
                                      onTap: () {
                                        assessmentController.startTimer();
                                        Get.to(() => const AssessmentTest());
                                      },
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                          SizedBox(height: cardPadding),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
