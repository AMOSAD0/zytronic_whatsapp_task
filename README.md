# Zytronic WhatsApp-style Flutter App Clone

**Candidate Name:** Ahmed Mossad  
**Project:** WhatsApp-style Flutter App Clone  
**Technology:** Flutter, Firebase Auth, Cloud Firestore

---

## Project Overview

This is a Flutter implementation of a WhatsApp-style messaging app, designed with **pixel-perfect UI**, clean architecture, and production-ready details.  
The app includes **Home (chat list), Chat (conversation), and Stories (status) screens** with microinteractions and responsive design.

---

## Screens Implemented

1. **Home Screen (Chat List)**

   - Displays all conversations with avatars, last message, and timestamps.

2. **Chat Screen (Conversation)**

   - Real-time messaging with message bubbles, timestamps, and input field.
   - Animated opening of chat and message sent feedback.

3. **Stories Screen (Status)**
   - Displays user stories with swipe gestures.
   - Animated progress bar transitions between stories.

---

## Features

- Pixel-perfect UI following WhatsApp design guidelines
- Responsive layout using `flutter_screenutil`
- Light and Dark mode support
- Firebase Authentication (Phone number login)
- Cloud Firestore for storing conversations and stories
- Microinteractions:
  - Chat opening animation
  - Message sent animation
  - Story progress bar animation
- Clean Architecture & Bloc state management

---

## Installation

1. Clone the repository:

```bash
git clone https://github.com/AMOSAD0/zytronic_whatsapp_task.git

```

2. Install dependencies:

```bash
flutter pub get
```

3. Connect your Firebase project:

   - Replace `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) with your Firebase credentials.

4. Run the app:

```bash
flutter run
```

## Screenshots / Demo

- `screenshots/home.png`
- `screenshots/chat.png`
- `screenshots/stories.png`
- Demo video: `demo/video.mp4`

---

## Author

**Ahmed Mossad**

---

## Notes

This project was created as part of the Zytronic Flutter Developer assessment task.  
It follows best practices, clean code architecture, and demonstrates Flutter UI skills, Firebase integration, and microinteractions.
