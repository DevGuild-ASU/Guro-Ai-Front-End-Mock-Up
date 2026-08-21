import 'package:flutter/material.dart';
import 'teacher_shared_widgets.dart';
import 'teacher_grading_queue_screen.dart';
import 'teacher_student_progress_screen.dart';
import 'teacher_deped_form_screen.dart';
import 'teacher_role_switcher_screen.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeacherColors.background,
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
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: TeacherColors.successBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.co_present_rounded,
                    size: 14, color: TeacherColors.primary),
                SizedBox(width: 4),
                Text(
                  'TEACHER',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.6,
                    color: TeacherColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: InitialsAvatar(initials: 'LR', size: 36),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 22, 18, 100),
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Magandang araw, Ma\'am Reyes!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: TeacherColors.ink,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Here is what your class is doing right now.',
                      style: TextStyle(
                        fontSize: 15,
                        color: TeacherColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: TeacherColors.border),
            ),
            child: Row(
              children: [
                const Icon(Icons.groups_rounded,
                    size: 18, color: TeacherColors.navy),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Grade 10 - Section A',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: TeacherColors.ink,
                    ),
                  ),
                ),
                SyncBadge(label: '36/38 online', icon: Icons.wifi_rounded),
                const SizedBox(width: 8),
                const Icon(Icons.keyboard_arrow_down_rounded,
                    color: TeacherColors.muted),
              ],
            ),
          ),

          const SizedBox(height: 26),
          const TeacherSectionHeading(title: 'Live Quiz Feed'),
          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [TeacherColors.primaryDark, TeacherColors.primary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: TeacherColors.primary.withValues(alpha: 0.22),
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
                      child: const Icon(Icons.sensors_rounded,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.circle, size: 8, color: Color(0xFFFFF4D2)),
                          SizedBox(width: 6),
                          Text(
                            'LIVE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'MATHEMATICS 10',
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
                const SizedBox(height: 6),
                const Text(
                  'Started 8:15 AM  •  Question 3 of 5',
                  style: TextStyle(color: Color(0xFFE5FFF5), fontSize: 13),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: 12 / 38,
                    minHeight: 8,
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '12 of 38 submitted',
                  style: TextStyle(color: Color(0xFFE5FFF5), fontSize: 12),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    const InitialsAvatar(
                        initials: 'J.R.', size: 40, color: Colors.white, showOnlineDot: true),
                    const SizedBox(width: 8),
                    const InitialsAvatar(
                        initials: 'M.S.', size: 40, color: Colors.white, showOnlineDot: true),
                    const SizedBox(width: 8),
                    const InitialsAvatar(
                        initials: 'B.A.', size: 40, color: Colors.white, showOnlineDot: true),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        '3 students answering now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const TeacherStudentProgressScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 9),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'View',
                          style: TextStyle(
                            color: TeacherColors.primaryDark,
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 26),
          const TeacherSectionHeading(title: 'Trend Alerts'),
          const SizedBox(height: 12),

          const TeacherCard(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.trending_down_rounded, color: TeacherColors.warning),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '3 students declining in Mathematics',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: TeacherColors.ink,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'J.R., M.S., and B.A. dropped below 75% this week. AI suggests a geometry review session.',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 13,
                          color: TeacherColors.muted,
                        ),
                      ),
                      SizedBox(height: 10),
                      SyncBadge(
                        label: 'Detected from student quiz data',
                        color: TeacherColors.warning,
                        background: TeacherColors.warningBg,
                        icon: Icons.auto_awesome_rounded,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          const TeacherCard(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.trending_up_rounded, color: TeacherColors.primary),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Class average up to 82%',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: TeacherColors.ink,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '+6% since last grading period. English shows the strongest improvement.',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 13,
                          color: TeacherColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 26),
          const TeacherSectionHeading(title: 'Needs Your Review'),
          const SizedBox(height: 12),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TeacherGradingQueueScreen(),
                ),
              );
            },
            child: const TeacherCard(
              child: Row(
                children: [
                  InitialsAvatar(initials: 'JD', showOnlineDot: true),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Juan Dela Cruz',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: TeacherColors.ink,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Geometry: Angles & Shapes • submitted 2 min ago',
                          style: TextStyle(
                            fontSize: 12,
                            color: TeacherColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right_rounded, color: TeacherColors.muted),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: TeacherColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text(
          'Launch New Quiz',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: TeacherColors.primary,
        unselectedItemColor: TeacherColors.navInactive,
        selectedLabelStyle:
            const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeacherGradingQueueScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeacherStudentProgressScreen(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeacherDepedFormScreen(),
              ),
            );
          } else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TeacherRoleSwitcherScreen(),
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
            icon: Icon(Icons.fact_check_outlined),
            activeIcon: Icon(Icons.fact_check_rounded),
            label: 'Grading',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            activeIcon: Icon(Icons.insights_rounded),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            activeIcon: Icon(Icons.description_rounded),
            label: 'Forms',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz_rounded),
            label: 'Switch',
          ),
        ],
      ),
    );
  }
}
