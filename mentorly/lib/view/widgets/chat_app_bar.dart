import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/style/colors.dart';

class AILearningAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AILearningAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: green, 
      elevation: 0,
      automaticallyImplyLeading: false, 
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: [
           
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/brain.png',
                  color: Colors.green,
                  height: 100,
                  width: 100,
                  // fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                 
                    return const Icon(
                      Icons.person,
                      color: Color(0xFF4CAF50),
                      size: 24,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
             
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AI Learning Assistant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Always here to help you learn',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

