// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Barre d'état personnalisée
          _buildStatusBar(),

          // Contenu principal
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),

                  const SizedBox(height: 20),
                  _buildSectionTitle("Langues apprises"),
                  _buildLanguages(),

                  const SizedBox(height: 20),
                  _buildSectionTitle("Statistiques"),
                  _buildStats(),

                  const SizedBox(height: 20),
                  _buildSectionTitle("Activité hebdomadaire"),
                  _buildActivity(),

                  const SizedBox(height: 20),
                  _buildSectionTitle("Objectifs & notifications"),
                  _buildGoals(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- BARRE D'ÉTAT ----------------
  Widget _buildStatusBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Heure
          const Text(
            "15:42",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          // Icônes de statut
          Row(
            children: const [
              Icon(Icons.signal_wifi_4_bar, color: Colors.white, size: 18),
              SizedBox(width: 5),
              Icon(Icons.battery_full, color: Colors.white, size: 18),
              SizedBox(width: 5),
              Icon(Icons.notifications, color: Colors.white, size: 18),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple]),
      ),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150',
            ), // Remplacez par l'URL de l'image de profil
          ),
          SizedBox(height: 8),
          Text(
            "Marie Dupont",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Membre depuis janvier 2024",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  // ---------------- TITRES DE SECTIONS ----------------
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // ---------------- LANGUES ----------------
  Widget _buildLanguages() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildLanguageCard(
            "Français",
            "B1 – progression 68%",
            Colors.blue,
            "Actif",
          ),
          const SizedBox(height: 10),
          _buildLanguageCard(
            "Espagnol",
            "A2 – progression 25%",
            Colors.red,
            "Pause",
          ),
          const SizedBox(height: 10),
          _buildLanguageCard(
            "Allemand",
            "A1 – progression 10%",
            Colors.green,
            "Actif",
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageCard(
    String lang,
    String level,
    Color color,
    String state,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(lang[0], style: const TextStyle(color: Colors.white)),
        ),
        title: Text(lang),
        subtitle: Text(level),
        trailing: Text(state, style: TextStyle(color: color)),
      ),
    );
  }

  // ---------------- STATS ----------------
  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStat("127", "Leçons"),
          _buildStat("850", "XP"),
          _buildStat("12", "Jours"),
          _buildStat("45m", "Temps/jour"),
        ],
      ),
    );
  }

  static Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(label),
      ],
    );
  }

  // ---------------- ACTIVITÉ ----------------
  Widget _buildActivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text(
            "Progression hebdomadaire",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                7,
                (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: (index + 1) * 10.0 + 20, // Hauteur dynamique
                      width: 15,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"][index],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- OBJECTIFS ----------------
  Widget _buildGoals() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text("Objectif quotidien"),
            subtitle: const Text("Apprendre min. 10 min par jour"),
            value: true,
            onChanged: (v) {
              // Action pour l'objectif quotidien
            },
          ),
          SwitchListTile(
            title: const Text("Notifications"),
            subtitle: const Text("Rappel quotidien, nouveaux cours…"),
            value: true,
            onChanged: (v) {
              // Action pour les notifications
            },
          ),
        ],
      ),
    );
  }
}
