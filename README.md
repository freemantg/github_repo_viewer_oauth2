# Repo Viewer - A Flutter Project 🐙

Repo Viewer is an advanced GitHub client application that exemplifies industry-leading best practices by seamlessly integrating OAuth 2.0, ensuring a secure and streamlined user experience.

## Features 📋

### User Authentication 🔒
- Implements the industry-standard OAuth2 protocol for secure user authentication.
- Securely persists tokens using `flutter_secure_storage` to ensure the user doesn't have to sign in every time the app is launched.

### Display of Paginated Data 🗂️
- Fetches paginated data from the server using `dio`, caches it locally with `sembast`, and displays it in the user interface.
- Displays the starred GitHub repositories of the signed-in user.

### Search Functionality 🔍
- Provides a sophisticated search functionality that enables the user to search for specific GitHub repositories using `material_floating_search_bar`.

### WebView Integration 🌐
- Integrates `webview_flutter` to display classic HTML content.
- Displays the README file of a GitHub repository within the application itself, ensuring a cohesive user experience.

### Code Structure & Management 🛠️
- Adopts the best practices for architecting Flutter applications.
- Employs `bloc` and `flutter_bloc` for state management, `auto_route` for routing and navigation, `dartz` for functional programming support, and `get_it` and `flutter_getit` for dependency injection.
- Utilizes `freezed`, `json_serializable` and `injectable` for code generation and `flutter_lints` and `lint` to enforce best practices and style guides.
- Employs effective code duplication removal techniques, ensuring a clean and maintainable codebase.

## Getting Started 🏁

To get started with the Repo Viewer project, follow these steps:

1. **Clone the Repository**: You can clone the repository by running `git clone https://github.com/<your-username>/repo-viewer.git` in your terminal.
2. **Get Dependencies**: Navigate to the project root directory and run `flutter pub get` to fetch the necessary dependencies.
3. **Build the Project**: Run `flutter run` to build and run the project in a connected device or emulator.

## Dependencies 📦

### Core dependencies
- [auto_route](https://pub.dev/packages/auto_route)
- [bloc](https://pub.dev/packages/bloc)
- [dio](https://pub.dev/packages/dio)
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- [material_floating_search_bar](https://pub.dev/packages/material_floating_search_bar)
- [webview_flutter](https://pub.dev/packages/webview_flutter)
- [dartz](https://pub.dev/packages/dartz)
- [sembast](https://pub.dev/packages/sembast)

### Dev dependencies
- [auto_route_generator](https://pub.dev/packages/auto_route_generator)
- [build_runner](https://pub.dev/packages/build_runner)
- [flutter_lints](https://pub.dev/packages/flutter_lints)
- [freezed](https://pub.dev/packages/freezed)
- [injectable_generator](https://pub.dev/packages/injectable_generator)
- [json_serializable](https://pub.dev/packages/json_serializable)
- [lint](https://pub.dev/packages/lint)

## Contributing 🤝

We welcome contributions from the community. If you wish to contribute, please take a look at our contributing guidelines.

## License 📄

Repo Viewer is licensed under the MIT License. See `LICENSE` for more information.

## Contact 📞

If you have any questions or suggestions, please reach out to us at <contact@freemantang.dev>. We'd love to hear from you!
