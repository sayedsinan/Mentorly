import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/info_card.dart';
import 'package:mentorly/view/widgets/progress_bar.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String email;
  final int level;
  final int rank;
  final String standard;
  final String className;
  final String syllabus;
  final String syllabusBoard;
  final int currentXP;
  final int totalXP;
  final int xpToNextLevel;
  final VoidCallback? onBackPressed;
  final VoidCallback? onSharePressed;
  final String? profileImageUrl;

  const ProfileAppBar({
    super.key,
    this.userName = "Alex Johnson",
    this.email = "alex.johnson@email.com",
    this.level = 12,
    this.rank = 2,
    this.standard = "Standard",
    this.className = "Class 10",
    this.syllabus = "Syllabus",
    this.syllabusBoard = "CBSE",
    this.currentXP = 2450,
    this.totalXP = 2800,
    this.xpToNextLevel = 350,
    this.onBackPressed,
    this.onSharePressed,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF8A2BE2), // Blue violet
            Color(0xFF9932CC), // Dark orchid
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              Row(
                children: [
                  // Profile image
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child:
                        profileImageUrl != null
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                profileImageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 40,
                                  );
                                },
                              ),
                            )
                            : const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40,
                            ),
                  ),

                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          email,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star_outline,
                                  color: Colors.white.withOpacity(0.9),
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Level $level',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Row(
                              children: [
                                Icon(
                                  Icons.emoji_events_outlined,
                                  color: Colors.white.withOpacity(0.9),
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Rank #$rank',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: InfoCard(title: standard, subtitle: className),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InfoCard(title: syllabus, subtitle: syllabusBoard),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Level progress card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Level Progress',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '$currentXP/$totalXP XP',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    CustomProgressBar(progress: .5),
                    const SizedBox(height: 8),

                    Text(
                      '$xpToNextLevel XP to next level',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(380);
}
