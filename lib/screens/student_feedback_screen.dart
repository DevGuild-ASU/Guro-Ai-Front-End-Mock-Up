import 'package:flutter/material.dart';

class StudentFeedbackScreen extends StatelessWidget {
  const StudentFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F8F7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Text(
            'Feedback',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF17223B),
            ),
          ),
          bottom: const TabBar(
            labelColor: Color(0xFF07966E),
            unselectedLabelColor: Color(0xFF68758B),
            indicatorColor: Color(0xFF07966E),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Reviewed'),
              Tab(text: 'Pending'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FeedbackList(
              showReviewed: true,
              showPending: true,
            ),
            FeedbackList(
              showReviewed: true,
              showPending: false,
            ),
            FeedbackList(
              showReviewed: false,
              showPending: true,
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackList extends StatelessWidget {
  const FeedbackList({
    super.key,
    required this.showReviewed,
    required this.showPending,
  });

  final bool showReviewed;
  final bool showPending;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        if (showPending) ...[
          const FeedbackCard(
            subject: 'Mathematics 9',
            quizTitle: 'Geometry: Angles & Shapes',
            score: '80%',
            teacherName: 'Ms. Angela Reyes',
            comment:
                'Your teacher is still reviewing the final feedback for this quiz.',
            date: 'Submitted today',
            isPending: true,
          ),
          if (showReviewed) const SizedBox(height: 14),
        ],
        if (showReviewed)
          const FeedbackCard(
            subject: 'English 9',
            quizTitle: 'Using Context Clues',
            score: '88%',
            teacherName: 'Ms. Liza Santos',
            comment:
                'Great work using context clues. Review questions 3 and 6 before our next activity.',
            date: 'Reviewed yesterday',
            isPending: false,
          ),
      ],
    );
  }
}

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({
    super.key,
    required this.subject,
    required this.quizTitle,
    required this.score,
    required this.teacherName,
    required this.comment,
    required this.date,
    required this.isPending,
  });

  final String subject;
  final String quizTitle;
  final String score;
  final String teacherName;
  final String comment;
  final String date;
  final bool isPending;

  @override
  Widget build(BuildContext context) {
    final Color statusColor = isPending
        ? const Color(0xFFE58A16)
        : const Color(0xFF07966E);

    final Color statusBackground = isPending
        ? const Color(0xFFFFF4D2)
        : const Color(0xFFE4F5EF);

    final String statusText = isPending
        ? 'Awaiting teacher review'
        : 'Reviewed by teacher';

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
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: statusBackground,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(
                    isPending
                        ? Icons.hourglass_top_rounded
                        : Icons.rate_review_outlined,
                    color: statusColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subject,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        quizTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF17223B),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  score,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF073B86),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: statusBackground,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                statusText,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              teacherName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF17223B),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              comment,
              style: const TextStyle(
                height: 1.5,
                color: Color(0xFF68758B),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Icon(
                  Icons.schedule_outlined,
                  size: 16,
                  color: Color(0xFF8A94A3),
                ),
                const SizedBox(width: 6),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8A94A3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}