import 'package:flutter/material.dart';
import 'student_progress_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({
    super.key,
    required this.selectedAnswers,
  });

  final List<int?> selectedAnswers;

  int calculateScore() {
    final correctAnswers = [1, 1, 2, 2, 2];
    int correctCount = 0;

    for (int index = 0;
        index < correctAnswers.length;
        index++) {
      if (selectedAnswers[index] ==
          correctAnswers[index]) {
        correctCount++;
      }
    }

    return ((correctCount / correctAnswers.length) * 100)
        .round();
  }

  @override
  Widget build(BuildContext context) {
    final score = calculateScore();
    final correctAnswers = (score / 20).round();
    final incorrectAnswers = 5 - correctAnswers;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Image.asset(
          'assets/branding/guro_ai_logo.png',
          width: 110,
          fit: BoxFit.contain,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 12),
            const Text(
              'Great job!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17223B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your quiz has been submitted.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF68758B),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Container(
                width: 130,
                height: 130,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFB9E8D8),
                    width: 12,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$correctAnswers / 5',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF17223B),
                      ),
                    ),
                    Text(
                      '$score%',
                      style: const TextStyle(
                        color: Color(0xFF68758B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ResultCountCard(
                    label: 'Correct',
                    value: correctAnswers,
                    color: const Color(0xFF07966E),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ResultCountCard(
                    label: 'Incorrect',
                    value: incorrectAnswers,
                    color: const Color(0xFFD64545),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: const BorderSide(
                  color: Color(0xFFE3E9EC),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.hourglass_top_rounded,
                          color: Color(0xFFE58A16),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Teacher Feedback',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF17223B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Your teacher is reviewing the final feedback for this quiz.',
                      style: TextStyle(
                        height: 1.5,
                        color: Color(0xFF68758B),
                      ),
                    ),
                    SizedBox(height: 14),
                    Chip(
                      label: Text(
                        'Awaiting teacher review',
                        style: TextStyle(
                          color: Color(0xFF9A5B08),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Color(0xFFFFF4D2),
                      side: BorderSide.none,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StudentProgressScreen(
                      latestScore: score,
                    ),
                  ),
                );
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                backgroundColor: const Color(0xFF07966E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'View My Progress',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultCountCard extends StatelessWidget {
  const ResultCountCard({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: Color(0xFFE3E9EC),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              '$value',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}