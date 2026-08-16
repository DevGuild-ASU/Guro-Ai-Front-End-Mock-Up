import 'package:flutter/material.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Image.asset(
          'assets/branding/guro_ai_logo.png',
          width: 110,
          fit: BoxFit.contain,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 12),
            const Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Color(0xFFDDEFE9),
                child: Text(
                  'JM',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF073B86),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Juan Miguel Dela Cruz',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17223B),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Grade 9 • Molave',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF68758B),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Student ID: •••• 4821',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF8A94A3),
              ),
            ),
            const SizedBox(height: 26),
            const ProfileSection(
              children: [
                ProfileItem(
                  icon: Icons.school_outlined,
                  title: 'School',
                  value: 'Mabini National High School',
                ),
                ProfileItem(
                  icon: Icons.groups_outlined,
                  title: 'Class',
                  value: 'Grade 9 • Molave',
                ),
                ProfileItem(
                  icon: Icons.cloud_done_outlined,
                  title: 'Sync Status',
                  value: 'Up to date',
                  valueColor: Color(0xFF07966E),
                ),
              ],
            ),
            const SizedBox(height: 22),
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17223B),
              ),
            ),
            const SizedBox(height: 12),
            ProfileSection(
              children: [
                const ProfileItem(
                  icon: Icons.settings_outlined,
                  title: 'Account Settings',
                  showArrow: true,
                ),
                const ProfileItem(
                  icon: Icons.lock_outline_rounded,
                  title: 'Privacy and Security',
                  showArrow: true,
                ),
                const ProfileItem(
                  icon: Icons.help_outline_rounded,
                  title: 'Help and Support',
                  showArrow: true,
                ),
                ProfileItem(
                  icon: Icons.logout_rounded,
                  title: 'End Shared-Device Session',
                  titleColor: const Color(0xFFD64545),
                  iconColor: const Color(0xFFD64545),
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('End your session?'),
                          content: const Text(
                            'Your information will be cleared from the screen before another student uses this device.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            FilledButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('End Session'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Guro.ai Student Demo • Mock Data Only',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF8A94A3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.children,
  });

  final List<Widget> children;

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
      child: Column(
        children: children,
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.valueColor,
    this.titleColor,
    this.iconColor,
    this.showArrow = false,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? value;
  final Color? valueColor;
  final Color? titleColor;
  final Color? iconColor;
  final bool showArrow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: iconColor ?? const Color(0xFF073B86),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: titleColor ?? const Color(0xFF17223B),
        ),
      ),
      subtitle: value == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                value!,
                style: TextStyle(
                  color: valueColor ?? const Color(0xFF68758B),
                ),
              ),
            ),
      trailing: showArrow
          ? const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF8A94A3),
            )
          : null,
    );
  }
}