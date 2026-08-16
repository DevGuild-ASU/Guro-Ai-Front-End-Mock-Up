import 'package:flutter/material.dart';
import 'quiz_question_screen.dart';

class QuizDetailsScreen extends StatelessWidget {
  const QuizDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Quiz Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF17223B),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFE4F5EF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.calculate_outlined,
                  size: 36,
                  color: Color(0xFF07966E),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'MATHEMATICS 9',
                style: TextStyle(
                  color: Color(0xFF07966E),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Geometry: Angles & Shapes',
                style: TextStyle(
                  fontSize: 28,
                  height: 1.2,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF17223B),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Prepared by Ms. Angela Reyes',
                style: TextStyle(
                  color: Color(0xFF68758B),
                ),
              ),
              const SizedBox(height: 30),
              const QuizInformationRow(
                icon: Icons.help_outline_rounded,
                text: '5 multiple-choice questions',
              ),
              const QuizInformationRow(
                icon: Icons.schedule_rounded,
                text: '15 minutes',
              ),
              const QuizInformationRow(
                icon: Icons.calendar_today_outlined,
                text: 'Due today at 5:00 PM',
              ),
              const QuizInformationRow(
                icon: Icons.cloud_done_outlined,
                text: 'Your answers will be saved',
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4D2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lightbulb_outline_rounded,
                      color: Color(0xFFC47B00),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Read each question carefully. You can review your answers before submitting.',
                        style: TextStyle(
                          height: 1.4,
                          color: Color(0xFF5E4A16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              FilledButton(
                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const QuizQuestionScreen(),
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
                  'Start Quiz',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizInformationRow extends StatelessWidget {
  const QuizInformationRow({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF073B86),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF17223B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}