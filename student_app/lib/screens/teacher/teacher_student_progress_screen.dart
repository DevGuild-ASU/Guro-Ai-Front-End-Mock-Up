import 'package:flutter/material.dart';
import 'teacher_shared_widgets.dart';

class TeacherStudentProgressScreen extends StatelessWidget {
  const TeacherStudentProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeacherColors.background,
      appBar: const TeacherAppBar(
        title: 'Student Progress',
        subtitle: 'Grade 10 - Section A',
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
        children: [
          TeacherCard(
            child: Row(
              children: [
                const InitialsAvatar(initials: 'JD', size: 54, showOnlineDot: true),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Juan Dela Cruz',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                          color: TeacherColors.ink,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Mathematics 10 • Last quiz today, 8:22 AM',
                        style: TextStyle(
                          fontSize: 12,
                          color: TeacherColors.muted,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SyncBadge(
                        label: 'Live from student device',
                        icon: Icons.smartphone_rounded,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: _SummaryStat(
                  icon: Icons.insights_rounded,
                  value: '84%',
                  label: 'Average Score',
                  color: TeacherColors.navy,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SummaryStat(
                  icon: Icons.check_circle_outline_rounded,
                  value: '13',
                  label: 'Quizzes Done',
                  color: TeacherColors.primary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 26),
          const TeacherSectionHeading(title: 'Score Trend'),
          const SizedBox(height: 12),

          TeacherCard(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.trending_up_rounded, color: TeacherColors.primary),
                    SizedBox(width: 8),
                    Text(
                      'Improving',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TeacherColors.primary,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Last 5 quizzes',
                      style: TextStyle(
                        fontSize: 12,
                        color: TeacherColors.muted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                const SizedBox(
                  height: 170,
                  child: CustomPaint(
                    painter: _TeacherLineChartPainter(),
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
              ],
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: TeacherColors.warningBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome_rounded, color: TeacherColors.warning),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AI Insight',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: TeacherColors.ink,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Juan improved steadily but struggles with word problems involving angle relationships. Recommend a targeted practice set on complementary and supplementary angles.',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 13,
                          color: TeacherColors.ink,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 26),
          const TeacherSectionHeading(title: 'Quiz History'),
          const SizedBox(height: 12),

          _QuizHistoryTile(
            title: 'Geometry: Angles & Shapes',
            subject: 'Mathematics 10',
            score: 80,
            status: 'Awaiting your review',
            pending: true,
          ),
          const SizedBox(height: 12),
          const _QuizHistoryTile(
            title: 'Using Context Clues',
            subject: 'English 10',
            score: 88,
            status: 'Reviewed by AI • approved',
            pending: false,
          ),
          const SizedBox(height: 12),
          const _QuizHistoryTile(
            title: 'Mga Elemento ng Tula',
            subject: 'Filipino 10',
            score: 75,
            status: 'Reviewed by AI • approved',
            pending: false,
          ),
        ],
      ),
    );
  }
}

class _SummaryStat extends StatelessWidget {
  const _SummaryStat({
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
        side: const BorderSide(color: TeacherColors.border),
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
                color: TeacherColors.ink,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: TeacherColors.muted),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuizHistoryTile extends StatelessWidget {
  const _QuizHistoryTile({
    required this.title,
    required this.subject,
    required this.score,
    required this.status,
    required this.pending,
  });

  final String title;
  final String subject;
  final int score;
  final String status;
  final bool pending;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: TeacherColors.border),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: TeacherColors.ink,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            '$subject\n$status',
            style: const TextStyle(
              height: 1.5,
              fontSize: 12,
              color: TeacherColors.muted,
            ),
          ),
        ),
        trailing: Text(
          '$score%',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: pending ? TeacherColors.warning : TeacherColors.navy,
          ),
        ),
      ),
    );
  }
}

class _TeacherLineChartPainter extends CustomPainter {
  const _TeacherLineChartPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const scores = [0.62, 0.70, 0.68, 0.77, 0.84];

    final gridPaint = Paint()
      ..color = TeacherColors.border
      ..strokeWidth = 1;

    for (int index = 0; index < 4; index++) {
      final y = index * size.height / 3;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final linePaint = Paint()
      ..color = TeacherColors.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final dotPaint = Paint()..color = TeacherColors.primary;

    final path = Path();

    for (int index = 0; index < scores.length; index++) {
      final x = index * size.width / (scores.length - 1);
      final y = size.height - (scores[index] * size.height);

      if (index == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      canvas.drawCircle(Offset(x, y), 5, Paint()..color = Colors.white);
      canvas.drawCircle(Offset(x, y), 3.5, dotPaint);
    }

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant _TeacherLineChartPainter oldDelegate) {
    return false;
  }
}
