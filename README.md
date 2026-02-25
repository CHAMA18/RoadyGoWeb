# roadygo_website

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Render deployment

This repo includes a Render blueprint in `render.yaml` for a static web deploy.

- Build command: `./scripts/render-build.sh`
- Publish directory: `build/web`

The build script installs Flutter only when it is not already available, then runs:

1. `flutter pub get`
2. `flutter build web --release`
