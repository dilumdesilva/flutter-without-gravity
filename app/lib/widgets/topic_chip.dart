import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';

class TopicChip extends StatelessWidget {
  final Topic topic;
  final bool isActive;

  const TopicChip({super.key, required this.topic, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.electricBlue : onSurface.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: isActive ? null : Border.all(color: onSurface.withOpacity(0.1)),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: AppTheme.electricBlue.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isActive) ...[
            const Icon(Icons.check, size: 14, color: Colors.white),
            const SizedBox(width: 6),
          ],
          Text(
            topic.title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: isActive ? Colors.white : onSurface.withOpacity(0.8),
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
