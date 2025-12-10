// ignore_for_file: depend_on_referenced_packages, avoid_print

// ignore: unused_import
import 'package:hive_flutter/hive_flutter.dart';
import 'storage_service.dart';
import 'package:linguapro/models/models.dart';

import 'dart:io' show Platform;

class HiveStorageService implements StorageService {
  static const String _boxProfile = 'profile_box';
  static const String _boxProgress = 'progress_box';
  static const String _boxLessons = 'lessons_box';

  Future<void> init() async {
    // Only initialize Hive for native platforms (Android, iOS, Windows, macOS, Linux)
    // Skip for web platform as Hive.initFlutter() is not supported
    try {
      if (!_isWeb()) {
        await Hive.initFlutter();
      }
      await Hive.openBox(_boxProfile);
      await Hive.openBox(_boxProgress);
      await Hive.openBox(_boxLessons);
    } catch (e) {
      // If initialization fails (e.g., on web), continue without Hive
      print('Hive initialization warning: $e');
    }
  }

  static bool _isWeb() {
    try {
      return !Platform.isAndroid &&
          !Platform.isIOS &&
          !Platform.isWindows &&
          !Platform.isMacOS &&
          !Platform.isLinux;
    } catch (e) {
      // Fallback for web where Platform is not available
      return true;
    }
  }

  @override
  Future<UserProfile?> loadUserProfile() async {
    final box = Hive.box(_boxProfile);
    final map = box.get('profile') as Map<dynamic, dynamic>?;
    if (map == null) return null;
    return UserProfile.fromJson(Map<String, dynamic>.from(map));
  }

  @override
  Future<void> saveUserProfile(UserProfile profile) async {
    final box = Hive.box(_boxProfile);
    await box.put('profile', profile.toJson());
  }

  @override
  Future<List<ProgressEntry>> loadProgress() async {
    final box = Hive.box(_boxProgress);
    final List<dynamic> items = box.get('progress') as List<dynamic>? ?? [];
    return items
        .map((e) => ProgressEntry.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  @override
  Future<void> saveProgress(List<ProgressEntry> progress) async {
    final box = Hive.box(_boxProgress);
    await box.put('progress', progress.map((e) => e.toJson()).toList());
  }

  @override
  Future<List<Lesson>> loadLessons() async {
    final box = Hive.box(_boxLessons);
    final List<dynamic> items = box.get('lessons') as List<dynamic>? ?? [];
    return items
        .map((e) => Lesson.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  @override
  Future<void> saveLessons(List<Lesson> lessons) async {
    final box = Hive.box(_boxLessons);
    await box.put('lessons', lessons.map((e) => e.toJson()).toList());
  }
}
