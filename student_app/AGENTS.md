# AGENTS.md — Guro.ai Student Mobile App

## Purpose

This document gives AI coding assistants and new contributors the context and rules needed to work safely on the Guro.ai student mobile application.

Read this file and `README.md` before changing project code.

## System Overview

Guro.ai is an educational platform intended for Philippine public-school students and teachers.

This project contains only the student-facing Flutter mobile application. The current version is a presentation-ready MVP that uses local mock data.

The teacher web dashboard belongs to another team member and is maintained separately. Do not modify, replace, or reorganize teacher-dashboard code while working on the student application.

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
│       └── student_profile_screen.dart
├── test/
│   └── widget_test.dart             # Basic Flutter widget test
├── AGENTS.md                        # AI and contributor instructions
├── README.md                        # Setup and run instructions
├── pubspec.yaml                     # Dependencies and assets
└── analysis_options.yaml            # Dart analyzer rules