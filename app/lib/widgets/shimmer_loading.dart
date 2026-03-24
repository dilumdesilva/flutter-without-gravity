import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_theme.dart';

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    return Shimmer.fromColors(
      baseColor: onSurface.withOpacity(0.05),
      highlightColor: onSurface.withOpacity(0.1),
      period: const Duration(milliseconds: 1500),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: onSurface.withOpacity(0.05),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class EventCardShimmer extends StatelessWidget {
  const EventCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.darkNavy.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ShimmerBox(width: 80, height: 20, borderRadius: 10),
              const ShimmerBox(width: 60, height: 20, borderRadius: 10),
            ],
          ),
          const SizedBox(height: 16),
          const ShimmerBox(width: 220, height: 24, borderRadius: 4),
          const SizedBox(height: 8),
          const ShimmerBox(width: 160, height: 24, borderRadius: 4),
          const Spacer(),
          const Row(
            children: [
              ShimmerBox(width: 20, height: 20, borderRadius: 10),
              SizedBox(width: 8),
              ShimmerBox(width: 120, height: 16, borderRadius: 4),
            ],
          ),
        ],
      ),
    );
  }
}

class SpeakerAvatarShimmer extends StatelessWidget {
  const SpeakerAvatarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          ShimmerBox(width: 80, height: 80, borderRadius: 40),
          SizedBox(height: 12),
          ShimmerBox(width: 70, height: 16, borderRadius: 4),
          SizedBox(height: 6),
          ShimmerBox(width: 90, height: 12, borderRadius: 4),
        ],
      ),
    );
  }
}

class TopicChipShimmer extends StatelessWidget {
  const TopicChipShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 12.0),
      child: ShimmerBox(width: 100, height: 40, borderRadius: 20),
    );
  }
}
