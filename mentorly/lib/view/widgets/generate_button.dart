import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';


class GenerateMoreTasksButton extends StatelessWidget {
  final VoidCallback? onTap;

  const GenerateMoreTasksButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 15),
      child: DottedBorder(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 45,
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.auto_awesome, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  "Generate More Tasks",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
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
