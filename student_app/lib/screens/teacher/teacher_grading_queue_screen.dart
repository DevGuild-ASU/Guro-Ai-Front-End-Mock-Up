import 'package:flutter/material.dart';
import 'teacher_shared_widgets.dart';

class TeacherGradingQueueScreen extends StatelessWidget {
  const TeacherGradingQueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeacherColors.background,
      appBar: const TeacherAppBar(
        title: 'AI Grading Review',
        subtitle: 'Grade 10 - Section A • Mathematics 10',
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
        children: [
          Row(
            children: [
              SyncBadge(label: 'Synced 2 min ago', icon: Icons.sync_rounded),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  '5 pending',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: TeacherColors.muted,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'AI drafts scores and feedback from student submissions. You approve before release.',
            style: TextStyle(fontSize: 13, height: 1.5, color: TeacherColors.muted),
          ),
          const SizedBox(height: 20),

          const GradingSubmissionCard(
            initials: 'JD',
            name: 'Juan Dela Cruz',
            quizTitle: 'Geometry: Angles & Shapes',
            submittedAt: 'Submitted today • 8:22 AM',
            questionNumber: 'Question 4 of 5',
            studentAnswer:
                'A triangle is a polygon with three sides and three angles. The sum of the interior angles is always 180 degrees because...',
            aiScore: '4 / 5',
            aiFeedback:
                'Correct concept and good use of the angle sum theorem. The explanation of the exterior angle rule is incomplete — add one more supporting detail.',
            syncNote: 'Received from Juan\'s device • synced 8:23 AM',
          ),

          const GradingSubmissionCard(
            initials: 'MS',
            name: 'Maria Santos',
            quizTitle: 'Geometry: Angles & Shapes',
            submittedAt: 'Submitted today • 8:19 AM',
            questionNumber: 'Question 2 of 5',
            studentAnswer:
                'Complementary angles add up to 90 degrees while supplementary angles add up to 180 degrees. For example, 30 and 60 degrees are complementary.',
            aiScore: '5 / 5',
            aiFeedback:
                'Excellent answer with accurate definitions and a correct example. Ready to be released to the student.',
            syncNote: 'Received from Maria\'s device • synced 8:20 AM',
          ),

          const GradingSubmissionCard(
            initials: 'BA',
            name: 'Benjamin Aquino',
            quizTitle: 'Geometry: Angles & Shapes',
            submittedAt: 'Submitted today • 8:17 AM',
            questionNumber: 'Question 5 of 5',
            studentAnswer:
                'Two triangles are congruent if they have the same shape. SSS means side side side I think, and ASA is angle side angle.',
            aiScore: '3 / 5',
            aiFeedback:
                'Partially correct. Congruent triangles must have the same shape AND size. The SSS and ASA mentions are right but need clearer justification.',
            syncNote: 'Received from Benjamin\'s device • synced 8:18 AM',
          ),
        ],
      ),
    );
  }
}

class GradingSubmissionCard extends StatelessWidget {
  const GradingSubmissionCard({
    super.key,
    required this.initials,
    required this.name,
    required this.quizTitle,
    required this.submittedAt,
    required this.questionNumber,
    required this.studentAnswer,
    required this.aiScore,
    required this.aiFeedback,
    required this.syncNote,
  });

  final String initials;
  final String name;
  final String quizTitle;
  final String submittedAt;
  final String questionNumber;
  final String studentAnswer;
  final String aiScore;
  final String aiFeedback;
  final String syncNote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Card(
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
              Row(
                children: [
                  InitialsAvatar(initials: initials, showOnlineDot: true),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: TeacherColors.ink,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '$quizTitle\n$submittedAt',
                          style: const TextStyle(
                            fontSize: 12,
                            height: 1.4,
                            color: TeacherColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: TeacherColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questionNumber,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: TeacherColors.navy,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '"$studentAnswer"',
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        fontStyle: FontStyle.italic,
                        color: TeacherColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: TeacherColors.successBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.auto_awesome_rounded,
                            size: 15, color: TeacherColors.primary),
                        const SizedBox(width: 6),
                        const Text(
                          'AI DRAFT',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.7,
                            color: TeacherColors.primary,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Score:',
                          style: TextStyle(
                            fontSize: 12,
                            color: TeacherColors.muted,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          aiScore,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: TeacherColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      aiFeedback,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: TeacherColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_rounded, size: 17),
                      label: const Text('Edit'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: TeacherColors.navy,
                        side: const BorderSide(color: TeacherColors.border),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.close_rounded, size: 17),
                      label: const Text('Reject'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: TeacherColors.warning,
                        side: const BorderSide(color: TeacherColors.warning),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.check_rounded, size: 17),
                      label: const Text('Approve'),
                      style: FilledButton.styleFrom(
                        backgroundColor: TeacherColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.smartphone_rounded,
                      size: 13, color: TeacherColors.muted),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      syncNote,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        color: TeacherColors.muted,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
