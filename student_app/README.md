# Guro.ai Student Mobile App Demo

Guro.ai is a student-facing Flutter mobile application designed for Philippine public-school learners.

This repository currently contains a presentation-ready front-end demo using fictional mock data. It demonstrates the core student workflow without connecting to a backend, database, real authentication system, or AI service.

## Current Scope

This project includes only the student-facing Android-first Flutter application.

Included:

- Official Guro.ai branding
- Student welcome screen
- Student dashboard
- Quizzes list
- Quiz information
- Five-question multiple-choice quiz
- Answer review
- Mock quiz submission and score
- Teacher-review status
- Student performance and trend graph
- Teacher feedback list
- Student profile
- Bottom navigation

Not included:

- Teacher dashboard
- Real authentication
- Backend or API integration
- Database integration
- Live AI grading
- Real student information
- Production offline synchronization
- Deployment or Play Store release

## Demo Workflow

```text
Welcome
→ Student Home
→ Quizzes List
→ Quiz Information
→ Take Quiz
→ Review Answers
→ Quiz Result
→ My Performance
```

The bottom navigation also provides access to:

```text
Home
Quizzes
Performance
Feedback
Profile
```

## Technology

- Flutter
- Dart
- Android-first mobile design
- Material Design 3
- Local mock data
- VS Code
- Android Studio emulator or physical Android device

## Requirements

Install the following before running the project:

1. Flutter SDK
2. Dart SDK, included with Flutter
3. Android Studio
4. Android SDK
5. Android emulator or physical Android device
6. VS Code
7. Flutter and Dart VS Code extensions
8. Git

Check the development environment with:

```powershell
flutter doctor
```

Resolve any required Android or Flutter issues reported by that command.

## Getting Started

### 1. Clone the repository

```powershell
git clone REPOSITORY_URL
```

Replace `REPOSITORY_URL` with the organization repository URL.

### 2. Open the project

Open the Flutter student-app folder in VS Code.

The correct folder contains:

```text
pubspec.yaml
lib/
android/
test/
```

### 3. Install Flutter packages

```powershell
flutter pub get
```

### 4. Start an Android device

Use either:

- An Android emulator created through Android Studio
- A physical Android phone with USB debugging enabled

Check available devices:

```powershell
flutter devices
```

### 5. Run the application

```powershell
flutter run
```

You may also open `lib/main.dart` and press `F5` in VS Code.

## Verification

Run static analysis:

```powershell
flutter analyze
```

Expected result:

```text
No issues found!
```

Run automated tests:

```powershell
flutter test
```

Expected result:

```text
All tests passed!
```

## Project Structure

```text
guro-ai-student-app/
├── android/                         # Android platform configuration
├── assets/
│   └── branding/
│       └── guro_ai_logo.png         # Official Guro.ai logo
├── lib/
│   ├── main.dart                    # Application entry and welcome screen
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
│   └── widget_test.dart             # Welcome-screen widget test
├── analysis_options.yaml
├── pubspec.yaml
└── README.md
```

## File Responsibilities

### `lib/main.dart`

- Starts the Flutter application
- Defines the global Material theme
- Displays the welcome screen
- Opens the student dashboard

### `student_home_screen.dart`

- Main student dashboard
- Featured active quiz
- Upcoming quizzes
- Recent results
- Bottom navigation
- Navigation to Quizzes, Performance, Feedback, and Profile

### `quizzes_list_screen.dart`

- All, Active, Upcoming, and Completed filters
- Mock quiz cards
- Opens Quiz Information

### `quiz_details_screen.dart`

- Subject and quiz title
- Question count
- Duration
- Deadline
- Instructions
- Opens the quiz-question flow

### `quiz_question_screen.dart`

- Contains five fictional multiple-choice questions
- Stores selected answers locally
- Supports Previous and Next navigation
- Retains selected answers during the current session

### `quiz_review_screen.dart`

- Displays the answer selected for every question
- Allows the student to review before submission
- Opens Quiz Result

### `quiz_result_screen.dart`

- Calculates the mock score locally
- Displays correct and incorrect totals
- Shows the pending teacher-review state
- Opens My Performance

### `student_progress_screen.dart`

- Shows latest score
- Shows completed-quiz count
- Displays subject progress
- Displays a mock performance trend graph
- Lists recent results

### `student_feedback_screen.dart`

- Displays reviewed and pending teacher feedback
- Provides All, Reviewed, and Pending filters
- Does not provide live chat

### `student_profile_screen.dart`

- Displays fictional student information
- Uses a masked student ID
- Displays school, class, and sync status
- Includes mock account and shared-device actions

## Mock Data

All names, classes, quiz questions, scores, dates, comments, and student details are fictional.

The demo does not:

- Send data to a server
- Store data in a production database
- Call an AI model
- Authenticate real users
- Use real student records or LRNs

Mock data may reset after the application is fully restarted.

## Branding

The app uses the official Guro.ai logo stored at:

```text
assets/branding/guro_ai_logo.png
```

The asset is registered in `pubspec.yaml`.

Primary visual colors include:

- Guro.ai green
- Deep blue
- White and light-gray surfaces
- Amber for pending review
- Green for reviewed or successful states
- Red for errors and destructive actions

## Development Guidelines

Before changing code:

1. Pull the latest changes from the team branch.
2. Create or switch to your assigned feature branch.
3. Confirm which app or folder you are modifying.
4. Do not edit the teacher dashboard for student-app tasks.
5. Do not add real student information.
6. Keep mock data clearly identified.
7. Run formatting, analysis, and tests.

Format Dart files:

```powershell
dart format lib test
```

Verify the project:

```powershell
flutter analyze
flutter test
```

## Git Workflow

Do not develop directly on `main`.

Recommended workflow:

```powershell
git switch main
git pull
git switch -c feature/student-mobile-demo
```

After making and verifying changes:

```powershell
git status
git add .
git commit -m "feat: add student mobile app demo"
git push -u origin feature/student-mobile-demo
```

Open a pull request for team review.

Do not merge until the repository structure and the teacher-dashboard location have been confirmed.

## Important Team Boundary

The teacher dashboard is maintained separately by another team member.

The student application should be stored in its own top-level folder when integrated into the shared repository, for example:

```text
GuroAIFrontend/
├── student_app/
└── teacher_dashboard/
```

The final folder names must be confirmed against the existing organization repository before files are moved or merged.

## Troubleshooting

### Flutter cannot find the logo

Run:

```powershell
flutter pub get
```

Then stop the app completely and run it again.

Confirm `pubspec.yaml` contains:

```yaml
flutter:
  uses-material-design: true

  assets:
    - assets/branding/guro_ai_logo.png
```

### No Android device is available

Start an emulator through Android Studio, then run:

```powershell
flutter devices
```

### Hot reload shows an old state or type error

Stop the application completely and rerun:

```powershell
flutter run
```

### Package or generated files appear outdated

Run:

```powershell
flutter clean
flutter pub get
flutter run
```

## Demo Status

The core student flow is functional and intended for presentation and front-end review.

The next project stages are:

1. Confirm the organization repository structure.
2. Move the student project into its approved top-level folder.
3. Remove or prevent duplicated Flutter project files.
4. Add detailed architecture and code documentation.
5. Commit through a student-app feature branch.
6. Open a pull request for team review.