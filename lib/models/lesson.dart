class Lesson {
  final String id;
  final String title;
  final String subtitle;
  final List<String> paragraphs; // plain text content
  final String? audioUrl;
  final String? imageUrl;

  Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    this.paragraphs = const [],
    this.audioUrl,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'paragraphs': paragraphs,
        'audioUrl': audioUrl,
        'imageUrl': imageUrl,
      };

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as String,
        title: json['title'] as String,
        subtitle: json['subtitle'] as String,
        paragraphs: (json['paragraphs'] as List<dynamic>?)?.cast<String>() ?? [],
        audioUrl: json['audioUrl'] as String?,
        imageUrl: json['imageUrl'] as String?,
      );
}
