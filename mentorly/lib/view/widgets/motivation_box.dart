import 'package:flutter/material.dart';

class MotivationBox extends StatelessWidget {
  const MotivationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 500,
            decoration: BoxDecoration(
              color: Color(0xFFEFFBF6),
              border: Border.all(color: Color(0xFFA8D1FB)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.favorite_outline, color: Color(0xFF3A65DD)),
                      SizedBox(width: 10),
                      Text(
                        "Daily Motivation",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF3A65DD),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.refresh, color: Color(0xFF3A65DD)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text(
                    ''' "Your progress in Mathematics shows real dedication. Every problem solved makes you stronger!"''',
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "_Ai Mentor",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3A65DD),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
