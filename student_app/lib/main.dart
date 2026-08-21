
import 'screens/student_home_screen.dart';
import 'screens/teacher/teacher_role_switcher_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GuroAiApp());
}

class GuroAiApp extends StatelessWidget {
  const GuroAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guro.ai Student',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F8F7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF07966E),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              Center(
  child: Image.asset(
    'assets/branding/guro_ai_logo.png',
    width: 260,
    height: 100,
    fit: BoxFit.contain,
  ),
),

              const SizedBox(height: 48),

              const Text(
                'Learn. Practice. Improve.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF17223B),
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'View your quizzes, submit your answers, and follow your learning progress.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF68758B),
                ),
              ),

              const Spacer(),

              FilledButton(
                onPressed: () {
              Navigator.push(
               context,
              MaterialPageRoute(
                 builder: (context) => const StudentHomeScreen(),
    ),
  );
},
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  backgroundColor: const Color(0xFF07966E),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Get started',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherRoleSwitcherScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.swap_horiz_rounded, size: 18),
                label: const Text(
                  'Switch to Teacher Mode (Demo)',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Student Demo • Mock Data Only',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF68758B),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}