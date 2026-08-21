import 'package:flutter/material.dart';
import 'teacher_shared_widgets.dart';
import 'teacher_home_screen.dart';

class TeacherRoleSwitcherScreen extends StatefulWidget {
  const TeacherRoleSwitcherScreen({super.key});

  @override
  State<TeacherRoleSwitcherScreen> createState() =>
      _TeacherRoleSwitcherScreenState();
}

class _TeacherRoleSwitcherScreenState extends State<TeacherRoleSwitcherScreen> {
  int selectedRole = 1;
  String selectedClassroom = 'Grade 10 - Section A';

  static const classrooms = [
    {'name': 'Grade 10 - Section A', 'students': 38, 'synced': 36},
    {'name': 'Grade 10 - Section B', 'students': 40, 'synced': 40},
    {'name': 'Grade 9 - Sampaguita', 'students': 42, 'synced': 39},
  ];

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
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 22, 18, 28),
          children: [
            const Text(
              'Choose your mode',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: TeacherColors.ink,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'One app for students and teachers.',
              style: TextStyle(fontSize: 15, color: TeacherColors.muted),
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: TeacherColors.border),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _RoleOption(
                      icon: Icons.school_outlined,
                      label: 'Student',
                      selected: selectedRole == 0,
                      onTap: () => setState(() => selectedRole = 0),
                    ),
                  ),
                  Expanded(
                    child: _RoleOption(
                      icon: Icons.co_present_outlined,
                      label: 'Teacher',
                      selected: selectedRole == 1,
                      onTap: () => setState(() => selectedRole = 1),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            const TeacherSectionHeading(title: 'My Classes'),
            const SizedBox(height: 12),

            ...classrooms.map((room) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _ClassroomCard(
                    name: room['name'] as String,
                    students: room['students'] as int,
                    synced: room['synced'] as int,
                    selected: selectedClassroom == room['name'],
                    onTap: () =>
                        setState(() => selectedClassroom = room['name'] as String),
                  ),
                )),

            const SizedBox(height: 16),
            SyncBadge(
              label: 'Live sync active • data from student devices',
              icon: Icons.wifi_rounded,
            ),

            const SizedBox(height: 26),
            FilledButton.icon(
              onPressed: selectedRole == 1
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TeacherHomeScreen(),
                        ),
                      );
                    }
                  : null,
              icon: const Icon(Icons.arrow_forward_rounded),
              label: Text(
                selectedRole == 1
                    ? 'Enter Teacher Mode'
                    : 'Continue as Student',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                backgroundColor: TeacherColors.primary,
                disabledBackgroundColor: TeacherColors.border,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Teacher Demo • Mock Data Only',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: TeacherColors.muted),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleOption extends StatelessWidget {
  const _RoleOption({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: selected ? TeacherColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: selected ? Colors.white : TeacherColors.muted,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : TeacherColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClassroomCard extends StatelessWidget {
  const _ClassroomCard({
    required this.name,
    required this.students,
    required this.synced,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final int students;
  final int synced;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: selected ? TeacherColors.primary : TeacherColors.border,
            width: selected ? 2 : 1,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: selected
                  ? TeacherColors.primary.withValues(alpha: 0.12)
                  : TeacherColors.avatarBg,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              Icons.groups_rounded,
              color: selected ? TeacherColors.primary : TeacherColors.navy,
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: TeacherColors.ink,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Text(
                  '$students students',
                  style: const TextStyle(
                    fontSize: 12,
                    color: TeacherColors.muted,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.circle,
                  size: 6,
                  color: synced == students
                      ? TeacherColors.primary
                      : TeacherColors.warning,
                ),
                const SizedBox(width: 4),
                Text(
                  '$synced devices synced',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: synced == students
                        ? TeacherColors.primary
                        : TeacherColors.warning,
                  ),
                ),
              ],
            ),
          ),
          trailing: selected
              ? const Icon(Icons.check_circle_rounded,
                  color: TeacherColors.primary)
              : const Icon(Icons.radio_button_unchecked_rounded,
                  color: TeacherColors.muted),
        ),
      ),
    );
  }
}
