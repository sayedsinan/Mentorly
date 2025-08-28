import 'package:flutter/material.dart';
class ProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;    
  final IconData icon;
  final Color color;
  
  const ProfileCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableWidth = constraints.maxWidth;
        final bool isSmallScreen = availableWidth < 400;
        final bool isMediumScreen = availableWidth >= 400 && availableWidth < 600;
        double cardWidth;
        double cardHeight;
        double iconSize;
        double titleFontSize;
        double subtitleFontSize;
        if (isSmallScreen) {
          cardWidth = (availableWidth - 32) / 2; 
          cardHeight = 100;
          iconSize = 32;
          titleFontSize = 20;
          subtitleFontSize = 14;
        } else if (isMediumScreen) {
          cardWidth = (availableWidth - 48) / 3;
          cardHeight = 120;
          iconSize = 36;
          titleFontSize = 22;
          subtitleFontSize = 15;
        } else {
          cardWidth = (availableWidth - 64) / 4; 
          cardHeight = 130;
          iconSize = 40;
          titleFontSize = 24;
          subtitleFontSize = 16;
        }
        cardWidth = cardWidth.clamp(120.0, 200.0);
        cardHeight = cardHeight.clamp(90.0, 140.0);
        return Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: iconSize, color: color),
              SizedBox(height: cardHeight * 0.06), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: color
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              SizedBox(height: cardHeight * 0.03), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: subtitleFontSize, 
                    fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}