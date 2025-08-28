import 'package:flutter/material.dart';
import 'package:mentorly/model/leadership_model.dart';
class LeaderShipCard extends StatelessWidget {
  final LeaderShipUser user;
  const LeaderShipCard({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 400;
    final double containerPadding = isSmallScreen ? 12 : 16;
    final double avatarRadius = isSmallScreen ? 18 : 20;
    final double crownSize = isSmallScreen ? 28 : 32;
    final double nameFont = isSmallScreen ? 15 : 16;
    final double xpFont = isSmallScreen ? 16 : 18;
    final double spacing = isSmallScreen ? 10 : 12;

    return Container(
      padding: EdgeInsets.all(containerPadding),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [

          Container(
            width: crownSize,
            height: crownSize,
            decoration: BoxDecoration(
              color: const Color(0xFFFFB800),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.emoji_events, 
              color: Colors.white, 
              size: crownSize * 0.55
            ),
          ),
          SizedBox(width: spacing),
          CircleAvatar(
            radius: avatarRadius,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: user.avatarUrl != null ? NetworkImage(user.avatarUrl!) : null,
            child: user.avatarUrl == null
                ? Icon(
                    Icons.person, 
                    color: Colors.grey.shade500, 
                    size: avatarRadius
                  )
                : null,
          ),

          SizedBox(width: spacing),
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
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.star_outline, size: 14, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Text(
                      "Level ${user.level}", 
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600)
                    ),

                    SizedBox(width: spacing),

                    Icon(Icons.local_fire_department, size: 14, color: Colors.orange.shade600),
                    const SizedBox(width: 4),
                    Text(
                      "1", 
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600)
                    ),
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
                  fontSize: xpFont, 
                  fontWeight: FontWeight.w700, 
                  color: const Color(0xFFFF6B35)
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "XP", 
                style: TextStyle(
                  fontSize: 12, 
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
