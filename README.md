# 📱 Profile UI Design
(screenshots/profile ui_.png)
A modern, interactive, and responsive User Profile Screen built with Flutter. This project demonstrates beautiful UI design, state management using `setState`, and smooth layouts.

---

## 📋 Submission Details

| | |
|---|---|
| **Submitted by** | Murad Hussain |
| **ID** | 232-134-009 |
| **Batch** | SWE 5th |
| **Course** | Mobile Application Development (MDP) |

---

## ✨ Features

- **Follow/Following Interaction:** Tapping the "Follow" button changes its state to "Following", updates the button style, and increments the followers count in real-time.
- **Statistics Dashboard:** Visual indicators showing the number of projects, followers count (dynamic), and years of experience.
- **Personal Details Card:** Structured information cards displaying email, student ID, department, batch, and institution using clean icons.
- **Cover Banner & Avatar Overlay:** An elegant overlapping profile picture layout created using Flutter `Stack` and `Positioned` widgets.
- **Update Status:** Cycles the project count dynamically using `setState`.

---

## 📸 Screenshots

>(screenshots/ui ss.png)

---

## 🧩 Core Widgets Used & Their Purpose

**Structural & Layout Widgets**
- **Scaffold:** Serves as the structural framework providing the app bar and body canvas.
- **SingleChildScrollView:** Wraps the body to enable scrolling on smaller screens.
- **Column & Row:** Arrange content vertically and horizontally respectively.
- **Expanded:** Flexibly distributes space for side-by-side buttons and stat columns.

**Visual & Decoration Widgets**
- **Stack & Positioned:** Key to creating the overlapping cover-photo and avatar layout.
- **CircleAvatar:** Styles and clips the profile photo into a rounded design.
- **Container:** Handles background colors, padding, border lines, and rounded shapes for all UI cards.

**Interactivity & State Widgets**
- **GestureDetector:** Captures touch/tap gestures on custom buttons.
- **StatefulWidget:** Enables dynamic state modification. Invoking `setState()` updates `isFollowing` (toggling button state and altering follower count) and `_projectCount`.

---

## 🚀 Getting Started

```bash
git clone https://github.com/your-username/flutter-profile-screen.git
cd flutter-profile-screen
flutter pub get
flutter run
```

Add your assets in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
```