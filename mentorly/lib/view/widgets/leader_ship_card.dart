import 'package:flutter/material.dart';
import 'package:mentorly/model/leadership_model.dart';

class LeaderShipCard extends StatelessWidget {
  final LeaderShipUser user;

  const LeaderShipCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isLargeScreen = screenWidth > 800;

    final avatarSize = isLargeScreen ? 56.0 : isTablet ? 52.0 : 48.0;
    final crownSize = isLargeScreen ? 56.0 : isTablet ? 52.0 : 48.0;
    final nameFont = isLargeScreen ? 20.0 : isTablet ? 19.0 : 18.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isLargeScreen ? 20 : isTablet ? 18 : 16),
      margin: EdgeInsets.symmetric(
        horizontal: isLargeScreen ? 20 : 16, 
        vertical: isLargeScreen ? 12 : 8
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Crown
          Container(
            width: crownSize,
            height: crownSize,
            decoration: const BoxDecoration(
              color: Color(0xFFFFB800),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.emoji_events, 
              color: Colors.white, 
              size: crownSize * 0.5
            ),
          ),

          SizedBox(width: isLargeScreen ? 20 : isTablet ? 18 : 16),
          
          CircleAvatar(
            radius: avatarSize / 2,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: user.avatarUrl != null ? NetworkImage(user.avatarUrl!) : null,
            child: user.avatarUrl == null
                ? Icon(
                    Icons.person, 
                    color: Colors.grey.shade400, 
                    size: avatarSize * 0.5
                  )
                : null,
          ),

          SizedBox(width: isLargeScreen ? 20 : isTablet ? 18 : 16),

          // Info - Back to Expanded for full content display
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.userName,
                  style: TextStyle(
                    fontSize: nameFont, 
                    fontWeight: FontWeight.w600, 
                    color: Colors.black87
                  ),
                ),
                SizedBox(height: isLargeScreen ? 8 : 6),
                Row(
                  children: [
                    Icon(Icons.star_outline, size: 16, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Text(
                      "Level ${user.level}", 
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600)
                    ),

                    SizedBox(width: isLargeScreen ? 20 : isTablet ? 18 : 16),

                    Icon(Icons.local_fire_department, size: 16, color: Colors.orange.shade600),
                   
                  ],
                ),
              ],
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${user.xpPoints}",
                style: TextStyle(
                  fontSize: isLargeScreen ? 24 : isTablet ? 22 : 20, 
                  fontWeight: FontWeight.bold, 
                  color: const Color(0xFFFF6B35)
                ),
              ),
              Text(
                "XP", 
                style: TextStyle(
                  fontSize: isLargeScreen ? 14 : 12, 
                  color: Colors.grey.shade600
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}