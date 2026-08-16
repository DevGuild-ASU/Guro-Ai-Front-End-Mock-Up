import 'package:flutter/material.dart';
import 'quiz_details_screen.dart';

class QuizzesListScreen extends StatelessWidget {
  const QuizzesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F8F7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Image.asset(
            'assets/branding/guro_ai_logo.png',
            width: 110,
            fit: BoxFit.contain,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.notifications_none_rounded,
                color: Color(0xFF17223B),
              ),
            ),
          ],
          bottom: const TabBar(
            labelColor: Color(0xFF07966E),
            unselectedLabelColor: Color(0xFF68758B),
            indicatorColor: Color(0xFF07966E),
            isScrollable: true,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Active'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _allQuizzes(context),
            _activeQuizzes(context),
            _upcomingQuizzes(),
            _completedQuizzes(),
          ],
        ),
      ),
    );
  }

  Widget _allQuizzes(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SectionLabel(title: 'Active'),
        QuizListCard(
          subject: 'Mathematics 9',
          title: 'Geometry: Angles & Shapes',
          detail: '5 questions • 15 minutes',
          status: 'Due today',
          color: const Color(0xFF07966E),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuizDetailsScreen(),
              ),
            );
          },
        ),
        const SectionLabel(title: 'Upcoming'),
        const QuizListCard(
          subject: 'Science 9',
          title: 'Motion and Forces',
          detail: '10 questions • Opens tomorrow',
          status: 'Upcoming',
          color: Color(0xFFE58A16),
        ),
        const SectionLabel(title: 'Completed'),
        const QuizListCard(
          subject: 'English 9',
          title: 'Using Context Clues',
          detail: 'Reviewed by teacher',
          status: '88%',
          color: Color(0xFF073B86),
        ),
      ],
    );
  }

  Widget _activeQuizzes(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        QuizListCard(
          subject: 'Mathematics 9',
          title: 'Geometry: Angles & Shapes',
          detail: '5 questions • 15 minutes',
          status: 'Due today',
          color: const Color(0xFF07966E),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuizDetailsScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _upcomingQuizzes() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        QuizListCard(
          subject: 'Science 9',
          title: 'Motion and Forces',
          detail: '10 questions • Opens tomorrow',
          status: 'Upcoming',
          color: Color(0xFFE58A16),
        ),
        SizedBox(height: 12),
        QuizListCard(
          subject: 'Mathematics 9',
          title: 'Linear Equations',
          detail: '8 questions • Opens Friday',
          status: 'Upcoming',
          color: Color(0xFFE58A16),
        ),
      ],
    );
  }

  Widget _completedQuizzes() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        QuizListCard(
          subject: 'English 9',
          title: 'Using Context Clues',
          detail: 'Reviewed by teacher',
          status: '88%',
          color: Color(0xFF073B86),
        ),
        SizedBox(height: 12),
        QuizListCard(
          subject: 'Filipino 9',
          title: 'Mga Elemento ng Tula',
          detail: 'Awaiting teacher review',
          status: '75%',
          color: Color(0xFF073B86),
        ),
      ],
    );
  }
}

class SectionLabel extends StatelessWidget {
  const SectionLabel({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 12,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: Color(0xFF17223B),
        ),
      ),
    );
  }
}

class QuizListCard extends StatelessWidget {
  const QuizListCard({
    super.key,
    required this.subject,
    required this.title,
    required this.detail,
    required this.status,
    required this.color,
    this.onTap,
  });

  final String subject;
  final String title;
  final String detail;
  final String status;
  final Color color;
  final VoidCallback? onTap;

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
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.assignment_outlined,
                  color: color,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: TextStyle(
                        color: color,
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
                      detail,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF68758B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                status,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}