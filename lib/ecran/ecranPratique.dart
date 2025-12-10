// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EcranPratique extends StatefulWidget {
  const EcranPratique({super.key});

  @override
  State<EcranPratique> createState() => _EcranPratiqueState();
}

class _EcranPratiqueState extends State<EcranPratique> {
  bool _isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF00A84F),
        elevation: 0,
        title: Text('Pratique & Révision'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Onglets
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  _buildTabButton('Mini-jeux', true),
                  SizedBox(width: 12),
                  _buildTabButton('Révision', false),
                  SizedBox(width: 12),
                  _buildTabButton('Prononciation', false),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mini-jeux
                  Text(
                    'Mini-jeux',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  _buildGameCard(
                    '🎮 Flashcards',
                    'Révise avec des cartes mémoire interactives',
                    Color(0xFF667EEA),
                    () {},
                  ),
                  SizedBox(height: 12),
                  _buildGameCard(
                    '🧠 Appairage',
                    'Associe les mots avec leurs traductions',
                    Color(0xFFFF6B6B),
                    () {},
                  ),
                  SizedBox(height: 12),
                  _buildGameCard(
                    '✍️ Remplissage',
                    'Complète les phrases avec les bonnes lettres',
                    Color(0xFF1ABC9C),
                    () {},
                  ),

                  SizedBox(height: 28),

                  // Répétition espacée
                  Text(
                    'Système de répétition espacée',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),

                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mots à réviser',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red[50],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '12',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: 0.4,
                            minHeight: 6,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation(Colors.red[400]),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Continue ta révision pour renforcer ta mémoire',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 28),

                  // Prononciation
                  Text(
                    'Pratique de prononciation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),

                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Prononce le mot',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Menu',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            setState(() => _isListening = !_isListening);
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: Icon(
                                _isListening ? Icons.stop : Icons.mic_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          _isListening ? 'En cours...' : 'Appuie pour parler',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 28),

                  // Historique de performance
                  Text(
                    'Historique de performance',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),

                  _buildPerformanceItem('Lundi', 8, 10, 0.8),
                  SizedBox(height: 8),
                  _buildPerformanceItem('Mardi', 9, 10, 0.9),
                  SizedBox(height: 8),
                  _buildPerformanceItem('Mercredi', 7, 10, 0.7),
                  SizedBox(height: 8),
                  _buildPerformanceItem('Jeudi', 10, 10, 1.0),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.grey[100] : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: isActive
            ? Border.all(color: Color(0xFF00A84F), width: 2)
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isActive ? Color(0xFF00A84F) : Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildGameCard(
    String title,
    String description,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  title.split(' ').first,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, color: color),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceItem(
    String day,
    int correct,
    int total,
    double percentage,
  ) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              day,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: percentage,
                minHeight: 6,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(
                  percentage >= 0.8 ? Colors.green : Colors.orange,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Text(
            '$correct/$total',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
