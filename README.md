# Darfy

> A Cupertino‑styled Flutter demo app that showcases a mock AI assistant for invoice classification in an accounting workflow. This project was made for a presentation, to exemplify the use of AI in business processes.

## Features

* **Onboarding** with a place to implement Lottie animations
* **Fake login** drawer (no backend required)
* **Fake AI** that classifies captured images as *income* or *expense*
* **Camera flow** using the `camera` plugin
* **Invoice list** with Riverpod state management
* Clean Architecture folder layout
  (domain >> data >> application >> presentation)

## Getting Started

```bash
flutter pub get
flutter run -d <device>
```

*Requires a working camera for the capture screen.*

## Project Layout

```
lib/
  main.dart            – App entry, ProviderScope & CupertinoApp.router
  core/router.dart     – GoRouter configuration
  features/
    onboarding/        – IntroductionScreen & animations
    auth/              – Login drawer sheet
    invoices/          – Invoice Clean Architecture stack
    camera/            – Camera capture & analyse sheet
assets/animations/     – Rive files (placeholders)
```

## Key Dependencies

| Package               | Purpose                       |
| --------------------- | ----------------------------- |
| `flutter_riverpod`    | State management              |
| `go_router`           | Declarative routing           |
| `camera`              | Camera access                 |
| `introduction_screen` | Onboarding carousel           |
| `modal_bottom_sheet`  | Cupertino‑style bottom sheets |
| `rive` / `lottie`     | Animations                    |
