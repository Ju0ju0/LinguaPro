class ProgressEntry {
  final String lessonId;
  final bool completed;
  final double score; // 0.0 - 1.0
  final DateTime lastPracticed;

  ProgressEntry({
    required this.lessonId,
    this.completed = false,
    this.score = 0.0,
    DateTime? lastPracticed,
  }) : lastPracticed = lastPracticed ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'lessonId': lessonId,
        'completed': completed,
        'score': score,
        'lastPracticed': lastPracticed.toIso8601String(),
      };

  factory ProgressEntry.fromJson(Map<String, dynamic> json) => ProgressEntry(
        lessonId: json['lessonId'] as String,
        completed: json['completed'] as bool? ?? false,
        score: (json['score'] as num?)?.toDouble() ?? 0.0,
        lastPracticed: DateTime.tryParse(json['lastPracticed'] as String? ?? '') ?? DateTime.now(),
      );
}
