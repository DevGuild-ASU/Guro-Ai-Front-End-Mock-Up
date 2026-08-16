import 'package:flutter/material.dart';
import 'quiz_result_screen.dart';

class QuizReviewScreen extends StatelessWidget {
  const QuizReviewScreen({
    super.key,
    required this.selectedAnswers,
  });

  final List<int?> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Review Answers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF17223B),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const Text(
                    'Almost finished!',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF17223B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Check your answers before submitting the quiz.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF68758B),
                    ),
                  ),
                  const SizedBox(height: 24),
                  for (int index = 0;
                      index < selectedAnswers.length;
                      index++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Card(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            color: Color(0xFFE3E9EC),
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xFFE4F5EF),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Color(0xFF07966E),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            'Question ${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF17223B),
                            ),
                          ),
                          subtitle: Text(
                            selectedAnswers[index] == null
                                ? 'Not answered'
                                : 'Selected answer: '
                                    '${String.fromCharCode(
                                  65 + selectedAnswers[index]!,
                                )}',
                          ),
                          trailing: const Icon(
                            Icons.check_circle_rounded,
                            color: Color(0xFF07966E),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
              child: FilledButton(
                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => QuizResultScreen(
        selectedAnswers: selectedAnswers,
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
                  'Submit Quiz',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}