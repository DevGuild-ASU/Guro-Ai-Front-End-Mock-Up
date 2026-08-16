import 'package:flutter/material.dart';
import 'quiz_review_screen.dart';

class QuizQuestionScreen extends StatefulWidget {
  const QuizQuestionScreen({super.key});

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  int currentQuestion = 0;

  final List<int?> selectedAnswers = List.filled(5, null);

  final List<QuizQuestion> questions = const [
    QuizQuestion(
      question: 'Which type of angle measures exactly 90 degrees?',
      answers: [
        'Acute angle',
        'Right angle',
        'Obtuse angle',
        'Straight angle',
      ],
    ),
    QuizQuestion(
      question:
          'A triangle has angles of 50° and 60°. What is the third angle?',
      answers: [
        '60°',
        '70°',
        '80°',
        '90°',
      ],
    ),
    QuizQuestion(
      question:
          'Which shape has four equal sides and four right angles?',
      answers: [
        'Rectangle',
        'Rhombus',
        'Square',
        'Trapezoid',
      ],
    ),
    QuizQuestion(
      question:
          'What is the sum of the interior angles of a quadrilateral?',
      answers: [
        '180°',
        '270°',
        '360°',
        '540°',
      ],
    ),
    QuizQuestion(
      question:
          'Which angle is greater than 90° but less than 180°?',
      answers: [
        'Acute angle',
        'Right angle',
        'Obtuse angle',
        'Reflex angle',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final isLastQuestion = currentQuestion == questions.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Geometry Quiz',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF17223B),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentQuestion + 1) / questions.length,
              minHeight: 5,
              backgroundColor: const Color(0xFFE3E9EC),
              color: const Color(0xFF07966E),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Row(
                    children: [
                      Text(
                        'Question ${currentQuestion + 1} of ${questions.length}',
                        style: const TextStyle(
                          color: Color(0xFF07966E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.schedule_outlined,
                        size: 18,
                        color: Color(0xFF68758B),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '14:32',
                        style: TextStyle(
                          color: Color(0xFF68758B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Text(
                    question.question,
                    style: const TextStyle(
                      fontSize: 23,
                      height: 1.35,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF17223B),
                    ),
                  ),
                  const SizedBox(height: 26),
                  for (int index = 0;
                      index < question.answers.length;
                      index++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AnswerOption(
                        letter: String.fromCharCode(65 + index),
                        text: question.answers[index],
                        isSelected:
                            selectedAnswers[currentQuestion] == index,
                        onTap: () {
                          setState(() {
                            selectedAnswers[currentQuestion] = index;
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
              child: Row(
                children: [
                  if (currentQuestion > 0) ...[
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            currentQuestion--;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(54),
                        ),
                        child: const Text('Previous'),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed:
                          selectedAnswers[currentQuestion] == null
                              ? null
                              : () {
                                  if (isLastQuestion) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => QuizReviewScreen(
        selectedAnswers: selectedAnswers,
      ),
    ),
  );
} else {
                                    setState(() {
                                      currentQuestion++;
                                    });
                                  }
                                },
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(54),
                        backgroundColor: const Color(0xFF07966E),
                        disabledBackgroundColor:
                            const Color(0xFFCBD5D1),
                      ),
                      child: Text(
                        isLastQuestion
                            ? 'Review Answers'
                            : 'Next Question',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizQuestion {
  const QuizQuestion({
    required this.question,
    required this.answers,
  });

  final String question;
  final List<String> answers;
}

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    super.key,
    required this.letter,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String letter;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFE4F5EF)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF07966E)
                : const Color(0xFFE3E9EC),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF07966E)
                    : const Color(0xFFF0F3F4),
                shape: BoxShape.circle,
              ),
              child: Text(
                letter,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : const Color(0xFF17223B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF17223B),
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF07966E),
              ),
          ],
        ),
      ),
    );
  }
}