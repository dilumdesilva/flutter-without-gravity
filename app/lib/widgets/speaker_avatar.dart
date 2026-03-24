import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';

class SpeakerAvatar extends StatelessWidget {
  final Speaker speaker;

  const SpeakerAvatar({super.key, required this.speaker});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 112, // Matching V1.7 w-28
          height: 112,
          padding: const EdgeInsets.all(2), // p-0.5
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppTheme.electricBlue, AppTheme.darkNavy],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: speaker.avatarUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(color: AppTheme.darkNavy),
                errorWidget: (context, url, error) => const Icon(Icons.person),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          speaker.name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          speaker.company,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppTheme.electricBlue,
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
