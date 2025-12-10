class UserProfile {
  final String id;
  final String name;
  final int level;
  final int dailyGoalMinutes;

  UserProfile({
    required this.id,
    required this.name,
    this.level = 1,
    this.dailyGoalMinutes = 20,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'level': level,
        'dailyGoalMinutes': dailyGoalMinutes,
      };

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['id'] as String,
        name: json['name'] as String,
        level: json['level'] as int? ?? 1,
        dailyGoalMinutes: json['dailyGoalMinutes'] as int? ?? 20,
      );
}
