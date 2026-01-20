# Project View: Blog App

## Overview

This document provides a comprehensive analysis of the project structure, explaining the purpose of each folder and file, and detailing the implementation of the connection checking mechanism.

## Project Structure

### Root Directory

- **`.gitignore`**: Specifies files and directories to be ignored by Git.
- **`analysis_options.yaml`**: Configures static analysis options for the Dart analyzer.
- **`pubspec.yaml`**: Defines the project's dependencies and metadata.
- **`pubspec.lock`**: Locks the versions of the dependencies to ensure consistency.
- **`README.md`**: Provides an overview of the project.

### Android and iOS Directories

- **`android/`**: Contains Android-specific configuration and code.
- **`ios/`**: Contains iOS-specific configuration and code.

### Lib Directory

The `lib` directory is the core of the Flutter application, containing all the Dart code for the app.

#### Core Directory (`lib/core/`)

- **`common/`**: Contains common utilities and widgets used across the app.
  - **`cubits/`**: Manages the state for common functionalities like user authentication.
  - **`entities/`**: Defines common entities such as `UserEntity`.
  - **`widgets/`**: Contains reusable widgets like `Loader`.

- **`error/`**: Handles exceptions and failures.
  - **`exception.dart`**: Defines custom exceptions.
  - **`failure.dart`**: Defines failure types.

- **`network/`**: Manages network-related functionalities.
  - **`connection_checker.dart`**: Implements the connection checking mechanism (explained in detail below).

- **`theme/`**: Manages the app's theme and color palette.
  - **`app_pallete.dart`**: Defines the color palette.
  - **`theme.dart`**: Configures the app's theme.

- **`usecase/`**: Defines the base use case structure.
  - **`usecase.dart`**: Provides the base `UseCase` class.

- **`utils/`**: Contains utility functions.
  - **`calculate_reading_time.dart`**: Calculates the reading time for blog posts.
  - **`format_date.dart`**: Formats dates.
  - **`pick_image.dart`**: Handles image picking functionality.
  - **`show_snackbar.dart`**: Displays snackbar messages.

#### Features Directory (`lib/features/`)

- **`auth/`**: Manages authentication-related functionalities.
  - **`data/`**: Contains data sources, models, and repositories.
  - **`domain/`**: Contains domain entities, repositories, and use cases.
  - **`presentation/`**: Contains presentation logic, including BLoC, pages, and widgets.

- **`blog/`**: Manages blog-related functionalities.
  - **`data/`**: Contains data sources, models, and repositories.
  - **`domain/`**: Contains domain entities, repositories, and use cases.
  - **`presentation/`**: Contains presentation logic, including BLoC, pages, and widgets.

### Main Files

- **`lib/main.dart`**: The entry point of the Flutter application.
- **`lib/init_dep.dart`**: Initializes dependencies for the app.

## Connection Checking Mechanism

The connection checking mechanism is implemented in [`lib/core/network/connection_checker.dart`](lib/core/network/connection_checker.dart). This mechanism ensures that the app can detect whether the device has an active internet connection before making network requests.

### Code Explanation

```dart
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class ConnectionChecker {
  Future<bool> get isConnected;
}

class ConnectionCheckerImpl implements ConnectionChecker {
  final InternetConnection internetConnection;

  ConnectionCheckerImpl({required this.internetConnection});

  @override
  Future<bool> get isConnected async =>
      await internetConnection.hasInternetAccess;
}
```

### Key Components

1. **`ConnectionChecker` Interface**:
   - This is an abstract interface class that defines a contract for checking internet connectivity.
   - It declares a single property, `isConnected`, which returns a `Future<bool>`. This property is used to asynchronously check if the device is connected to the internet.

2. **`ConnectionCheckerImpl` Class**:
   - This class implements the `ConnectionChecker` interface.
   - It takes an `InternetConnection` object as a dependency, which is injected through the constructor. This follows the Dependency Injection (DI) principle, making the class more testable and modular.
   - The `isConnected` property is overridden to use the `hasInternetAccess` method of the `InternetConnection` object. This method checks if the device has internet access and returns a boolean value wrapped in a `Future`.

### Usage

- The `ConnectionCheckerImpl` class is used to check the internet connection status before making any network requests. This ensures that the app can handle offline scenarios gracefully and provide appropriate feedback to the user.

### Dependencies

- The `internet_connection_checker_plus` package is used to provide the `InternetConnection` class, which offers robust internet connectivity checking functionality.

## Conclusion

This project follows a clean architecture pattern, separating concerns into distinct layers: data, domain, and presentation. The connection checking mechanism is a critical component for ensuring a smooth user experience, especially in scenarios where network connectivity is unreliable.
