import 'package:flutter/material.dart';

class QuickQuestion extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final IconData icon;

  const QuickQuestion({
    super.key,
    this.onTap,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isTablet = screenWidth > 600;
        final isDesktop = screenWidth > 1024;
        
        // Responsive sizing
        final iconSize = isDesktop ? 28.0 : isTablet ? 26.0 : 24.0;
        final iconContainerSize = isDesktop ? 50.0 : isTablet ? 45.0 : 40.0;
        final fontSize = isDesktop ? 18.0 : isTablet ? 17.0 : 16.0;
        final verticalPadding = isDesktop ? 24.0 : isTablet ? 22.0 : 20.0;
        final horizontalPadding = isDesktop ? 28.0 : isTablet ? 26.0 : 24.0;
        final margin = isDesktop ? 12.0 : isTablet ? 10.0 : 8.0;
        final borderRadius = isDesktop ? 16.0 : isTablet ? 14.0 : 12.0;
        final iconBorderRadius = isDesktop ? 10.0 : isTablet ? 9.0 : 8.0;
        final spacing = isDesktop ? 16.0 : isTablet ? 14.0 : 12.0;

        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: isDesktop ? 120 : isTablet ? 110 : 100,
              maxWidth: isDesktop ? 300 : isTablet ? 280 : double.infinity,
            ),
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            margin: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: Colors.grey.shade300,
                width: isDesktop ? 1.5 : 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(isDesktop ? 0.15 : 0.1),
                  spreadRadius: isDesktop ? 2 : 1,
                  blurRadius: isDesktop ? 6 : 4,
                  offset: Offset(0, isDesktop ? 3 : 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon container
                Container(
                  width: iconContainerSize,
                  height: iconContainerSize,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(iconBorderRadius),
                  ),
                  child: Icon(
                    icon,
                    size: iconSize,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: spacing),
                // Text
                Flexible(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      height: 1.3, // Line height for better readability
                    ),
                    textAlign: TextAlign.center,
                    maxLines: isDesktop ? 3 : isTablet ? 3 : 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
