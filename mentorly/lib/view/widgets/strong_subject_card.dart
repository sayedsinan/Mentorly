  import 'package:flutter/material.dart';

  class StrongSubjectCard extends StatefulWidget {
    final String subject;
    final String topics;
    final IconData icon;
    final bool isSelected;
    final VoidCallback? onTap;


    const StrongSubjectCard({
      super.key,
      required this.subject,
      required this.topics,
      required this.icon,
      this.isSelected = false,
      this.onTap,
    });

    @override
    State<StrongSubjectCard> createState() => _StrongSubjectCardState();
  }

  class _StrongSubjectCardState extends State<StrongSubjectCard> {
    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 80,
          width: 320,
          decoration: BoxDecoration(
            color: widget.isSelected ? const Color(0xFFE8F5E8) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: widget.isSelected 
                ? Border.all(color: const Color(0xFF4CAF50), width: 2)
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Subject Icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: widget.isSelected 
                        ? const Color(0xFF4CAF50).withOpacity(0.2)
                        : const Color(0xFF6366F1).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    widget.icon,
                    color: widget.isSelected 
                        ? const Color(0xFF4CAF50)
                        : const Color(0xFF6366F1),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                
                // Subject Info
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.subject,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: widget.isSelected 
                                  ? const Color(0xFF2E7D32)
                                  : Colors.black87,
                            ),
                          ),
                          if (widget.isSelected) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "Strong",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.topics,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: widget.isSelected 
                              ? const Color(0xFF388E3C)
                              : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Selection Indicator
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isSelected 
                        ? const Color(0xFF4CAF50)
                        : Colors.grey[300],
                  ),
                  child: widget.isSelected
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 14,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }