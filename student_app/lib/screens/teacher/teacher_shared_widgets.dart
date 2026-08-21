import 'package:flutter/material.dart';

class TeacherColors {
  static const background = Color(0xFFF5F8F7);
  static const primary = Color(0xFF07966E);
  static const primaryDark = Color(0xFF06734F);
  static const navy = Color(0xFF073B86);
  static const ink = Color(0xFF17223B);
  static const muted = Color(0xFF68758B);
  static const border = Color(0xFFE3E9EC);
  static const warning = Color(0xFFE58A16);
  static const warningBg = Color(0xFFFFF4D2);
  static const successBg = Color(0xFFE4F5EF);
  static const avatarBg = Color(0xFFDDEFE9);
  static const navInactive = Color(0xFF7A8494);
}

class SyncBadge extends StatelessWidget {
  const SyncBadge({
    super.key,
    required this.label,
    this.color = TeacherColors.primary,
    this.background = TeacherColors.successBg,
    this.icon = Icons.sync_rounded,
  });

  final String label;
  final Color color;
  final Color background;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TeacherSectionHeading extends StatelessWidget {
  const TeacherSectionHeading({
    super.key,
    required this.title,
    this.actionText,
    this.onAction,
  });

  final String title;
  final String? actionText;
  final VoidCallback? onAction;

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
              color: TeacherColors.ink,
            ),
          ),
        ),
        if (actionText != null)
          GestureDetector(
            onTap: onAction,
            child: Text(
              actionText!,
              style: const TextStyle(
                color: TeacherColors.primary,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: TeacherColors.border),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({
    super.key,
    required this.initials,
    this.size = 46,
    this.color = TeacherColors.navy,
    this.showOnlineDot = false,
  });

  final String initials;
  final double size;
  final Color color;
  final bool showOnlineDot;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            initials,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: size * 0.34,
            ),
          ),
        ),
        if (showOnlineDot)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size * 0.26,
              height: size * 0.26,
              decoration: BoxDecoration(
                color: TeacherColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}

class TeacherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TeacherAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  @override
  Size get preferredSize =>
      Size.fromHeight(subtitle != null ? kToolbarHeight + 18 : kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      toolbarHeight: preferredSize.height,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: TeacherColors.ink,
              fontSize: 18,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 12,
                color: TeacherColors.muted,
              ),
            ),
        ],
      ),
      actions: actions,
    );
  }
}
