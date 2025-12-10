import 'package:flutter/material.dart';

class EcranLessons extends StatelessWidget {
  final String lesson;
  final String title;
  final String subtitle;

  const EcranLessons({
    super.key,
    required this.lesson,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    const Color mainGreen = Color(0xFF00A84F); // Vert LinguaPro
    const Color lightGreen = Color(0xFFDFF5E1); // Vert clair

    return Scaffold(
      backgroundColor: lightGreen, // ✅ fond vert clair
      appBar: AppBar(
        title: Text(title),
        backgroundColor: mainGreen,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // Carte vocabulaire
            Card(
              color: Colors.white,
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
                      style: TextStyle(fontSize: 20, color: mainGreen),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainGreen,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                  ),
                  onPressed: () {
                    // TODO: action précédent
                  },
                  child: const Text("Précédent"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainGreen,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                  ),
                  onPressed: () {
                    // TODO: action suivant
                  },
                  child: const Text("Suivant"),
                ),
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isCorrect ? const Color(0xFFDFF5E1) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF00A84F),
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
        title: Text(text),
      ),
    );
  }
}
