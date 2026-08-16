import 'package:flutter/material.dart';
import 'quizzes_list_screen.dart';
import 'student_progress_screen.dart';
import 'student_feedback_screen.dart';
import 'student_profile_screen.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({
    super.key,
    this.quizCompleted = false,
  });

  final bool quizCompleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/branding/guro_ai_logo.png',
          width: 115,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xFF17223B),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Color(0xFFDDEFE9),
              child: Text(
                'JM',
                style: TextStyle(
                  color: Color(0xFF073B86),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 22, 18, 28),
        children: [
          const Text(
            'Magandang araw, Juan!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: Color(0xFF17223B),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Ready to continue learning?',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF68758B),
            ),
          ),
          const SizedBox(height: 26),

          const SectionHeading(
            title: 'Active Quiz',
            actionText: 'View all',
          ),
          const SizedBox(height: 12),

          // Featured active quiz
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF06734F),
                  Color(0xFF07966E),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF07966E).withValues(alpha: 0.22),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.calculate_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        quizCompleted ? 'Submitted' : 'Due today',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Text(
                  'MATHEMATICS 9',
                  style: TextStyle(
                    color: Color(0xFFD6F5E9),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.7,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Geometry: Angles & Shapes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '5 questions  •  15 minutes',
                  style: TextStyle(
                    color: Color(0xFFE5FFF5),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 18),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const QuizzesListScreen(),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF06734F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    quizCompleted
                        ? 'View Quiz Result'
                        : 'View Quizzes',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),
          const SectionHeading(
            title: 'Upcoming Quizzes',
            actionText: 'See all',
          ),
          const SizedBox(height: 12),

          const UpcomingQuizCard(
            icon: Icons.science_outlined,
            iconColor: Color(0xFFE58A16),
            subject: 'Science 9',
            title: 'Motion and Forces',
            schedule: 'Tomorrow • 10:00 AM',
          ),

          const SizedBox(height: 28),
          const SectionHeading(
            title: 'Recent Results',
            actionText: 'View progress',
          ),
          const SizedBox(height: 12),

          if (quizCompleted) ...[
            const RecentResultCard(
              subject: 'Mathematics 9',
              title: 'Geometry: Angles & Shapes',
              score: '80%',
              status: 'Awaiting teacher review',
              scoreColor: Color(0xFF07966E),
            ),
            const SizedBox(height: 12),
          ],

          const RecentResultCard(
            subject: 'English 9',
            title: 'Using Context Clues',
            score: '88%',
            status: 'Reviewed by teacher',
            scoreColor: Color(0xFF073B86),
          ),
          const SizedBox(height: 12),
          const RecentResultCard(
            subject: 'Filipino 9',
            title: 'Mga Elemento ng Tula',
            score: '75%',
            status: 'Awaiting teacher review',
            scoreColor: Color(0xFFE58A16),
          ),
        ],
      ),

      // Batch Two visual navigation.
      // Additional destinations will be connected in later steps.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF07966E),
        unselectedItemColor: const Color(0xFF7A8494),
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        onTap: (index) {
  if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QuizzesListScreen(),
      ),
    );
  } else if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StudentProgressScreen(
          latestScore: 80,
        ),
      ),
    );
 } else if (index == 3) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          const StudentFeedbackScreen(),
    ),
  );
} else if (index == 4) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          const StudentProfileScreen(),
    ),
  );
}
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            activeIcon: Icon(Icons.assignment_rounded),
            label: 'Quizzes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            activeIcon: Icon(Icons.insights_rounded),
            label: 'Performance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            activeIcon: Icon(Icons.chat_bubble_rounded),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    required this.actionText,
  });

  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xFF17223B),
            ),
          ),
        ),
        Text(
          actionText,
          style: const TextStyle(
            color: Color(0xFF07966E),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class UpcomingQuizCard extends StatelessWidget {
  const UpcomingQuizCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.subject,
    required this.title,
    required this.schedule,
  });

  final IconData icon;
  final Color iconColor;
  final String subject;
  final String title;
  final String schedule;

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
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: const TextStyle(
                      color: Color(0xFF07966E),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF17223B),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    schedule,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF68758B),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF68758B),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentResultCard extends StatelessWidget {
  const RecentResultCard({
    super.key,
    required this.subject,
    required this.title,
    required this.score,
    required this.status,
    required this.scoreColor,
  });

  final String subject;
  final String title;
  final String score;
  final String status;
  final Color scoreColor;

 @override
Widget build(BuildContext context) {
  final bool isPending =
      status.toLowerCase().contains('awaiting');

  final Color statusColor = isPending
      ? const Color(0xFFE58A16)
      : const Color(0xFF07966E);

  final Color statusBackground = isPending
      ? const Color(0xFFFFF4D2)
      : const Color(0xFFE4F5EF);

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
        leading: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: scoreColor.withValues(alpha: 0.11),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(
            Icons.emoji_events_outlined,
            color: scoreColor,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: Color(0xFF17223B),
          ),
        ),
        subtitle: Padding(
  padding: const EdgeInsets.only(top: 6),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        subject,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF68758B),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: statusBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          status,
          style: TextStyle(
            fontSize: 11,
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
), // Padding
trailing: Text(
  score,
  style: TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w900,
    color: scoreColor,
  ),
),
), // ListTile
); // Card
}
}