// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'ecran/ecranAccueil.dart';
import 'ecran/ecranPratique.dart';
import 'ecran/ecranProfil.dart';
import 'services/hive_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hiveStorage = HiveStorageService();
  await hiveStorage.init();

  runApp(const LinguaProApp());
}

class LinguaProApp extends StatelessWidget {
  const LinguaProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinguaPro',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: MainNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigation extends StatefulWidget {
  MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  late final List<Widget> _screens = [
    const EcranAccueil(),
    EcranLessons(
      lesson: 'restaurant',
      title: 'Vocabulaire: Au restaurant',
      subtitle: 'Leçon 1 sur 8 • 15 nouveaux mots',
    ),
    const EcranPratique(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF00A84F),
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: 'Leçons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports_outlined),
            activeIcon: Icon(Icons.sports_esports),
            label: 'Pratique',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class EcranLessons extends StatelessWidget {
  final String lesson;
  final String title;
  final String subtitle;

  const EcranLessons({
    required this.lesson,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.deepPurple),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            // Carte vocabulaire
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "📘 Mot du jour",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Le Menu (masculin)",
                      style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Exemple : Je voudrais voir le menu, s'il vous plaît.",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Quiz
            const Text(
              "📝 Quiz rapide",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Comment dit-on 'menu' en français ?"),
            const SizedBox(height: 12),

            QuizOption(label: "A", text: "La carte"),
            QuizOption(label: "B", text: "Le menu", isCorrect: true),
            QuizOption(label: "C", text: "L'addition"),
            QuizOption(label: "D", text: "Le plat"),

            const Spacer(),

            // Boutons navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Précédent"),
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Suivant")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuizOption extends StatelessWidget {
  final String label;
  final String text;
  final bool isCorrect;

  const QuizOption({
    super.key,
    required this.label,
    required this.text,
    this.isCorrect = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(label)),
      title: Text(text),
      tileColor: isCorrect ? Colors.green.shade100 : null,
    );
  }
}
