# AGENTS.md — Guro.ai Student Mobile App

## Purpose

This document gives AI coding assistants and new contributors the context and rules needed to work safely on the Guro.ai student mobile application.

Read this file and `README.md` before changing project code.

## System Overview

Guro.ai is an educational platform intended for Philippine public-school students and teachers.

This project contains only the student-facing Flutter mobile application. The current version is a presentation-ready MVP that uses local mock data.

The teacher web dashboard belongs to another team member and is maintained separately. Do not modify, replace, or reorganize teacher-dashboard code while working on the student application.

A Teacher Mode demo also lives inside this same app (see "Teacher Mode Demo" below). It is a visual mockup only — no backend, no real grading, no real form generation.

## MVP Scope

The current student MVP demonstrates this workflow:

1. Welcome screen
2. Student Home dashboard
3. Quizzes list
4. Quiz information
5. Five-question multiple-choice quiz
6. Review answers
7. Submit quiz
8. Quiz result
9. Awaiting teacher review
10. Student performance
11. Teacher feedback
12. Student profile

The bottom navigation contains:

- Home
- Quizzes
- Performance
- Feedback
- Profile

## Teacher Mode Demo

Teacher Mode is a high-fidelity visual mockup inside the same app, reached via the "Switch to Teacher Mode (Demo)" button on the welcome screen. It demonstrates a role switcher (Student ↔ Teacher) and five teacher screens using realistic Filipino dummy data:

1. Role Switcher + Classroom Selector (Grade 10 - Section A selected)
2. Teacher Home Dashboard (Live Quiz Feed, Launch New Quiz FAB, trend alerts)
3. AI Grading Review Queue (AI-drafted scores/feedback with Approve/Edit/Reject)
4. Student Progress Drill-Down (line graph, AI insight, quiz history)
5. DepEd Form Auto-Fill (SF1 draft with Review & Edit Draft)

Rules for Teacher Mode work:

- It is a demo only. Do not add backend calls, real grading logic, or real form generation.
- Reuse the existing student-side design system exactly — no new colors, typography, or component styles.
- Keep live-sync indicators and "data from student devices" messaging visible; they are part of the demo story.
- Teacher screens belong in `lib/screens/teacher/` and shared teacher widgets in `teacher_shared_widgets.dart`.

## Technology

- Flutter
- Dart
- Material 3
- Android-first mobile design
- VS Code for coding
- Android Studio for the emulator and Android tools

The current architecture uses:

- `Navigator` and `MaterialPageRoute`
- Local widget state
- Hard-coded mock data
- Simple feature-per-screen organization
- A custom-painted performance graph
- No external state-management package
- No backend, API, or database connection

## Project Structure

```text
student_app/
├── android/                         # Android platform configuration
├── assets/
│   └── branding/
│       └── guro_ai_logo.png         # Official Guro.ai logo
├── ios/                             # iOS platform files
├── lib/
│   ├── main.dart                    # App entry point and welcome screen
│   └── screens/
│       ├── student_home_screen.dart
│       ├── quizzes_list_screen.dart
│       ├── quiz_details_screen.dart
│       ├── quiz_question_screen.dart
│       ├── quiz_review_screen.dart
│       ├── quiz_result_screen.dart
│       ├── student_progress_screen.dart
│       ├── student_feedback_screen.dart
│       ├── student_profile_screen.dart
│       └── teacher/                  # Teacher Mode demo (visual mockup only)
│           ├── teacher_shared_widgets.dart
│           ├── teacher_role_switcher_screen.dart
│           ├── teacher_home_screen.dart
│           ├── teacher_grading_queue_screen.dart
│           ├── teacher_student_progress_screen.dart
│           └── teacher_deped_form_screen.dart
├── test/
│   └── widget_test.dart             # Basic Flutter widget test
├── AGENTS.md                        # AI and contributor instructions
├── README.md                        # Setup and run instructions
├── pubspec.yaml                     # Dependencies and assets
└── analysis_options.yaml            # Dart analyzer rules