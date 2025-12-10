import 'package:linguapro/models/models.dart';

/// StorageService: abstraction for persisting user data, progress and lessons.
abstract class StorageService {
  Future<void> saveUserProfile(UserProfile profile);
  Future<UserProfile?> loadUserProfile();

  Future<void> saveProgress(List<ProgressEntry> progress);
  Future<List<ProgressEntry>> loadProgress();

  Future<void> saveLessons(List<Lesson> lessons);
  Future<List<Lesson>> loadLessons();
}

/// In-memory implementation (useful for testing and as default)
class InMemoryStorageService implements StorageService {
  UserProfile? _profile;
  final List<ProgressEntry> _progress = [];
  final List<Lesson> _lessons = [];

  @override
  Future<UserProfile?> loadUserProfile() async => _profile;

  @override
  Future<void> saveUserProfile(UserProfile profile) async {
    _profile = profile;
  }

  @override
  Future<List<ProgressEntry>> loadProgress() async => List.unmodifiable(_progress);

  @override
  Future<void> saveProgress(List<ProgressEntry> progress) async {
    _progress
      ..clear()
      ..addAll(progress);
  }

  @override
  Future<List<Lesson>> loadLessons() async => List.unmodifiable(_lessons);

  @override
  Future<void> saveLessons(List<Lesson> lessons) async {
    _lessons
      ..clear()
      ..addAll(lessons);
  }
}
