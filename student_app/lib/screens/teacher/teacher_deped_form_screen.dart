import 'package:flutter/material.dart';
import 'teacher_shared_widgets.dart';

class TeacherDepedFormScreen extends StatelessWidget {
  const TeacherDepedFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeacherColors.background,
      appBar: const TeacherAppBar(
        title: 'DepEd Forms',
        subtitle: 'Grade 10 - Section A • School Year 2026-2027',
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: TeacherColors.successBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome_rounded, color: TeacherColors.primary),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SF1 Auto-Fill Ready',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: TeacherColors.ink,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '38 of 38 learner profiles pulled from student devices. Draft generated on Aug 21, 2026 • 9:05 AM.',
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

          const SizedBox(height: 22),

          Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: const BorderSide(color: TeacherColors.border),
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
                          color: TeacherColors.navy.withValues(alpha: 0.11),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Icon(Icons.description_rounded,
                            color: TeacherColors.navy),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SF1 — School Register',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: TeacherColors.ink,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'DRAFT • auto-filled',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: TeacherColors.warning,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  const _FormFieldRow(
                      label: 'School Name', value: 'San Isidro National High School'),
                  const _FormFieldRow(label: 'School ID', value: '301234'),
                  const _FormFieldRow(
                      label: 'Grade & Section', value: 'Grade 10 - Section A'),
                  const _FormFieldRow(
                      label: 'Adviser', value: 'Ma\'am Liwayway Reyes'),
                  const _FormFieldRow(
                      label: 'Number of Learners', value: '38 (19 M / 19 F)'),

                  const Divider(height: 32, color: TeacherColors.border),

                  const Text(
                    'Sample Learner Entries',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: TeacherColors.ink,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Showing 3 of 38 rows',
                    style: TextStyle(fontSize: 12, color: TeacherColors.muted),
                  ),
                  const SizedBox(height: 12),

                  const _LearnerRow(
                    number: '1',
                    name: 'Dela Cruz, Juan Miguel',
                    sex: 'M',
                    birthDate: '04/12/2011',
                    lrn: '136012345678',
                  ),
                  const _LearnerRow(
                    number: '2',
                    name: 'Santos, Maria Clara',
                    sex: 'F',
                    birthDate: '09/25/2011',
                    lrn: '136087654321',
                  ),
                  const _LearnerRow(
                    number: '3',
                    name: 'Aquino, Benjamin Jr.',
                    sex: 'M',
                    birthDate: '01/08/2012',
                    lrn: '136056781234',
                  ),

                  const SizedBox(height: 16),
                  SyncBadge(
                    label: 'Fields verified against student profiles',
                    icon: Icons.verified_rounded,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 22),

          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit_note_rounded),
            label: const Text(
              'Review & Edit Draft',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(56),
              backgroundColor: TeacherColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.picture_as_pdf_outlined),
            label: const Text(
              'Export as PDF',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: TeacherColors.navy,
              minimumSize: const Size.fromHeight(52),
              side: const BorderSide(color: TeacherColors.border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'DepEd Forms Demo • Mock Data Only',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: TeacherColors.muted),
          ),
        ],
      ),
    );
  }
}

class _FormFieldRow extends StatelessWidget {
  const _FormFieldRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              letterSpacing: 0.8,
              fontWeight: FontWeight.bold,
              color: TeacherColors.muted,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            decoration: BoxDecoration(
              color: TeacherColors.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: TeacherColors.border),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: TeacherColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LearnerRow extends StatelessWidget {
  const _LearnerRow({
    required this.number,
    required this.name,
    required this.sex,
    required this.birthDate,
    required this.lrn,
  });

  final String number;
  final String name;
  final String sex;
  final String birthDate;
  final String lrn;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: TeacherColors.border),
      ),
      child: Row(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: TeacherColors.muted,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: TeacherColors.ink,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'LRN $lrn • DOB $birthDate',
                  style: const TextStyle(
                    fontSize: 11,
                    color: TeacherColors.muted,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            decoration: BoxDecoration(
              color: sex == 'M'
                  ? TeacherColors.navy.withValues(alpha: 0.1)
                  : TeacherColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              sex,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: sex == 'M' ? TeacherColors.navy : TeacherColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
