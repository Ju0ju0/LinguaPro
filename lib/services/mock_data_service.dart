import 'package:linguapro/models/models.dart';

class MockDataService {
  /// Returns a few sample lessons and quiz questions
  static List<Lesson> sampleLessons() {
    return [
      Lesson(
        id: 'restaurant',
        title: 'Le Menu',
        subtitle: 'The Menu',
        paragraphs: [
          "Le menu est sur la table.",
          "Je voudrais voir le menu, s'il vous plaît.",
        ],
      ),
      Lesson(
        id: 'bonjour',
        title: 'Bonjour',
        subtitle: 'Hello',
        paragraphs: ["Bonjour! Comment ça va?"],
      ),
    ];
  }

  static List<QuizQuestion> sampleQuiz() {
    return [
      QuizQuestion(
        id: 'q1',
        question: 'Comment dit-on "menu" en français?',
        options: ['La carte', 'Le menu', "L'addition", 'Le plat'],
        correctIndex: 1,
      ),
    ];
  }

  static UserProfile sampleProfile() {
    return UserProfile(id: 'user1', name: 'Justine', level: 3, dailyGoalMinutes: 30);
  }
}
