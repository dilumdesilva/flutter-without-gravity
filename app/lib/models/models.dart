class Speaker {
  final String id;
  final String name;
  final String role;
  final String company;
  final String avatarUrl;
  final String talkTitle;
  final String bio;

  Speaker({
    required this.id,
    required this.name,
    required this.role,
    required this.company,
    required this.avatarUrl,
    required this.talkTitle,
    required this.bio,
  });
}

class Event {
  final String id;
  final String title;
  final String date;
  final String time;
  final String category;
  final String format;
  final String venue;
  final String address;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.category,
    required this.format,
    required this.venue,
    required this.address,
  });
}

class Topic {
  final String id;
  final String title;

  Topic({required this.id, required this.title});
}
