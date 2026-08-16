import 'package:flutter/material.dart';
import 'student_home_screen.dart';

class StudentProgressScreen extends StatelessWidget {
  const StudentProgressScreen({
    super.key,
    required this.latestScore,
  });

  final int latestScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'My Progress',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF17223B),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Keep growing, Juan!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17223B),
              ),
            ),
            const SizedBox(height: 20),
FilledButton.icon(
  onPressed: () {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const StudentHomeScreen(),
      ),
      (route) => false,
    );
  },
  icon: const Icon(Icons.home_rounded),
  label: const Text('Back to Dashboard'),
  style: FilledButton.styleFrom(
    minimumSize: const Size.fromHeight(56),
    backgroundColor: const Color(0xFF07966E),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
),
            const SizedBox(height: 6),
            const Text(
              'Here is a summary of your learning progress.',
              style: TextStyle(
                color: Color(0xFF68758B),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ProgressSummaryCard(
                    icon: Icons.insights_rounded,
                    value: '$latestScore%',
                    label: 'Latest Score',
                    color: const Color(0xFF073B86),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: ProgressSummaryCard(
                    icon: Icons.check_circle_outline_rounded,
                    value: '13',
                    label: 'Completed',
                    color: Color(0xFF07966E),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            const Text(
              'Recent Trend',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17223B),
              ),
            ),
            const SizedBox(height: 12),
           Card(
  color: Colors.white,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18),
    side: const BorderSide(
      color: Color(0xFFE3E9EC),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.all(18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.trending_up_rounded,
              color: Color(0xFF07966E),
            ),
            SizedBox(width: 8),
            Text(
              'Improving',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF07966E),
              ),
            ),
            Spacer(),
            Text(
              'Last 5 quizzes',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF68758B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        const SizedBox(
          height: 170,
          child: CustomPaint(
            painter: ProgressLineChartPainter(),
            child: SizedBox.expand(),
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quiz 1', style: TextStyle(fontSize: 10)),
            Text('Quiz 2', style: TextStyle(fontSize: 10)),
            Text('Quiz 3', style: TextStyle(fontSize: 10)),
            Text('Quiz 4', style: TextStyle(fontSize: 10)),
            Text('Latest', style: TextStyle(fontSize: 10)),
          ],
        ),
        const SizedBox(height: 18),
        const Text(
          'Your scores are improving. Keep reviewing geometry and context clues.',
          style: TextStyle(
            height: 1.5,
            color: Color(0xFF68758B),
          ),
        ),
      ],
    ),
  ),
),
            const SizedBox(height: 26),
            const Text(
              'By Subject',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17223B),
              ),
            ),
            const SizedBox(height: 16),
            const SubjectProgress(
              subject: 'Mathematics',
              progress: 0.84,
              color: Color(0xFF07966E),
            ),
            const SubjectProgress(
              subject: 'English',
              progress: 0.88,
              color: Color(0xFF073B86),
            ),
            const SubjectProgress(
              subject: 'Science',
              progress: 0.76,
              color: Color(0xFFE58A16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Results',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17223B),
              ),
            ),
            const SizedBox(height: 12),
            ResultTile(
              title: 'Geometry: Angles & Shapes',
              subject: 'Mathematics 9',
              score: latestScore,
              status: 'Awaiting teacher review',
            ),
            const SizedBox(height: 12),
            const ResultTile(
              title: 'Using Context Clues',
              subject: 'English 9',
              score: 88,
              status: 'Reviewed by teacher',
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressSummaryCard extends StatelessWidget {
  const ProgressSummaryCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(
          color: Color(0xFFE3E9EC),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 14),
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17223B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF68758B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectProgress extends StatelessWidget {
  const SubjectProgress({
    super.key,
    required this.subject,
    required this.progress,
    required this.color,
  });

  final String subject;
  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  subject,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF17223B),
                  ),
                ),
              ),
              Text(
                '${(progress * 100).round()}%',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
            backgroundColor: const Color(0xFFE3E9EC),
            color: color,
          ),
        ],
      ),
    );
  }
}

class ResultTile extends StatelessWidget {
  const ResultTile({
    super.key,
    required this.title,
    required this.subject,
    required this.score,
    required this.status,
  });

  final String title;
  final String subject;
  final int score;
  final String status;

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
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF17223B),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            '$subject\n$status',
            style: const TextStyle(
              height: 1.5,
              color: Color(0xFF68758B),
            ),
          ),
        ),
        trailing: Text(
          '$score%',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Color(0xFF073B86),
          ),
        ),
      ),
    );
  }
}
class ProgressLineChartPainter extends CustomPainter {
  const ProgressLineChartPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const scores = [0.62, 0.70, 0.68, 0.77, 0.84];

    final gridPaint = Paint()
      ..color = const Color(0xFFE3E9EC)
      ..strokeWidth = 1;

    for (int index = 0; index < 4; index++) {
      final y = index * size.height / 3;

      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    final linePaint = Paint()
      ..color = const Color(0xFF07966E)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final dotPaint = Paint()
      ..color = const Color(0xFF07966E);

    final path = Path();

    for (int index = 0; index < scores.length; index++) {
      final x = index * size.width / (scores.length - 1);
      final y = size.height - (scores[index] * size.height);

      if (index == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      canvas.drawCircle(
        Offset(x, y),
        5,
        Paint()..color = Colors.white,
      );

      canvas.drawCircle(
        Offset(x, y),
        3.5,
        dotPaint,
      );
    }

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(
    covariant ProgressLineChartPainter oldDelegate,
  ) {
    return false;
  }
}