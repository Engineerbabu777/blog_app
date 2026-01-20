# Blog App

A Flutter-based blog application built using Clean Architecture principles. This app allows users to create, read, and manage blog posts with a clean and intuitive interface.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Architecture](#architecture)
   - [Clean Architecture](#clean-architecture)
   - [Layers](#layers)
   - [Dependencies](#dependencies)
4. [Folder Structure](#folder-structure)
   - [Core](#core)
   - [Features](#features)
   - [Auth](#auth)
   - [Blog](#blog)
5. [File Descriptions](#file-descriptions)
   - [Core Files](#core-files)
   - [Auth Files](#auth-files)
   - [Blog Files](#blog-files)
6. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
   - [Running the App](#running-the-app)
7. [Usage](#usage)
8. [Testing](#testing)
9. [Contributing](#contributing)
10. [License](#license)

## Project Overview

The Blog App is designed to provide a seamless experience for users to create, read, and manage blog posts. It leverages Flutter for cross-platform compatibility and Clean Architecture for maintainability and scalability.

## Features

- User Authentication (Sign Up, Sign In)
- Create, Read, Update, and Delete Blog Posts
- Real-time Updates
- Offline Support
- Responsive Design

## Architecture

### Clean Architecture

Clean Architecture is a software design philosophy that separates the elements of a design into ring levels. The main idea is to make the system:

1. **Independent of Frameworks**: The architecture does not depend on the existence of some library or framework.
2. **Testable**: The business rules can be tested without the UI, database, web server, or any other external element.
3. **Independent of UI**: The UI can change easily without changing the rest of the system.
4. **Independent of Database**: You can swap out Oracle or SQL Server for MongoDB or CouchDB without affecting the business rules.
5. **Independent of Any External Agency**: The business rules simply don’t know anything at all about the outside world.

### Layers

The architecture is divided into several layers:

1. **Domain Layer**: Contains the business logic and entities.
2. **Data Layer**: Handles data retrieval and storage.
3. **Presentation Layer**: Manages the UI and user interactions.

### Dependencies

The dependencies flow inward. The inner layers (Domain) do not know anything about the outer layers (Presentation). This ensures that the business logic remains pure and independent of external changes.

## Folder Structure

### Core

The `core` folder contains shared utilities, constants, and base classes used across the application.

- **common**: Shared widgets and utilities.
- **constants**: Application-wide constants.
- **error**: Error handling and exceptions.
- **network**: Network-related utilities.
- **theme**: Application themes and styling.
- **usecase**: Base use case classes.
- **utils**: Utility functions and helpers.

### Features

The `features` folder contains the main features of the application, each organized into its own subfolder.

#### Auth

The `auth` feature handles user authentication.

- **data**: Data models, repositories, and data sources.
- **domain**: Business logic and entities.
- **presentation**: UI components and state management.

#### Blog

The `blog` feature handles blog post management.

- **data**: Data models, repositories, and data sources.
- **domain**: Business logic and entities.
- **presentation**: UI components and state management.

## File Descriptions

### Core Files

#### `lib/core/common/cubits/app_user/app_user_cubit.dart`

This file contains the `AppUserCubit` class, which manages the state of the currently authenticated user. It provides methods to update the user state and listen to changes.

#### `lib/core/common/cubits/app_user/app_user_state.dart`

This file defines the `AppUserState` class, which represents the state of the authenticated user. It includes properties for the user entity and methods to copy the state with new values.

#### `lib/core/common/entities/user_entity.dart`

This file defines the `UserEntity` class, which represents a user in the application. It includes properties for the user's ID, name, and email.

#### `lib/core/common/widgets/loader.dart`

This file contains the `Loader` widget, which displays a loading indicator. It is used to show loading states in the UI.

#### `lib/core/constants/constants.dart`

This file contains application-wide constants, such as API endpoints and keys.

#### `lib/core/error/exception.dart`

This file defines custom exceptions used in the application, such as `ServerException` and `CacheException`.

#### `lib/core/error/failure.dart`

This file defines the `Failure` class, which represents a failure in the application. It includes properties for the error message and stack trace.

#### `lib/core/network/connection_checker.dart`

This file contains the `ConnectionChecker` class, which checks the device's internet connection status.

#### `lib/core/theme/app_pallete.dart`

This file defines the application's color palette, including primary, secondary, and accent colors.

#### `lib/core/theme/theme.dart`

This file contains the application's theme definitions, including light and dark themes.

#### `lib/core/usecase/usecase.dart`

This file defines the base `UseCase` class, which is used to encapsulate business logic.

#### `lib/core/utils/calculate_reading_time.dart`

This file contains the `calculateReadingTime` function, which calculates the reading time for a blog post based on its content.

#### `lib/core/utils/format_date.dart`

This file contains the `formatDate` function, which formats a date string into a human-readable format.

#### `lib/core/utils/pick_image.dart`

This file contains the `pickImage` function, which allows users to pick an image from their device.

#### `lib/core/utils/show_snackbar.dart`

This file contains the `showSnackBar` function, which displays a snackbar message in the UI.

### Auth Files

#### `lib/features/auth/data/datasources/auth_remote_data_source.dart`

This file contains the `AuthRemoteDataSource` class, which handles remote authentication operations, such as signing in and signing up.

#### `lib/features/auth/data/models/user_models.dart`

This file defines the `UserModel` class, which represents a user in the data layer. It includes methods to convert between the model and entity.

#### `lib/features/auth/data/repositories/auth_repository_impl.dart`

This file contains the `AuthRepositoryImpl` class, which implements the `AuthRepository` interface. It provides methods to perform authentication operations.

#### `lib/features/auth/domain/respository/auth_repository.dart`

This file defines the `AuthRepository` interface, which specifies the methods for authentication operations.

#### `lib/features/auth/domain/use-cases/current_user.dart`

This file contains the `CurrentUser` use case, which retrieves the currently authenticated user.

#### `lib/features/auth/domain/use-cases/user_sign_in.dart`

This file contains the `UserSignIn` use case, which handles user sign-in operations.

#### `lib/features/auth/domain/use-cases/user_sign_up.dart`

This file contains the `UserSignUp` use case, which handles user sign-up operations.

#### `lib/features/auth/presentation/bloc/auth_bloc.dart`

This file contains the `AuthBloc` class, which manages the state of the authentication feature. It handles events such as sign-in and sign-up.

#### `lib/features/auth/presentation/bloc/auth_event.dart`

This file defines the `AuthEvent` class, which represents events in the authentication feature, such as sign-in and sign-up.

#### `lib/features/auth/presentation/bloc/auth_state.dart`

This file defines the `AuthState` class, which represents the state of the authentication feature, such as loading, success, and failure.

#### `lib/features/auth/presentation/pages/signin_page.dart`

This file contains the `SignInPage` widget, which displays the sign-in screen.

#### `lib/features/auth/presentation/pages/signup_page.dart`

This file contains the `SignUpPage` widget, which displays the sign-up screen.

#### `lib/features/auth/presentation/widgets/auth_field.dart`

This file contains the `AuthField` widget, which is a reusable text field for authentication forms.

#### `lib/features/auth/presentation/widgets/auth_gradient_button.dart`

This file contains the `AuthGradientButton` widget, which is a reusable button for authentication forms.

### Blog Files

#### `lib/features/blog/data/datasources/blog_local_datasource.dart`

This file contains the `BlogLocalDataSource` class, which handles local blog post operations, such as caching and retrieving blog posts.

#### `lib/features/blog/data/datasources/blog_remote_datasource.dart`

This file contains the `BlogRemoteDataSource` class, which handles remote blog post operations, such as fetching and uploading blog posts.

#### `lib/features/blog/data/models/blog_model.dart`

This file defines the `BlogModel` class, which represents a blog post in the data layer. It includes methods to convert between the model and entity.

#### `lib/features/blog/data/repositories/blog_repository_impl.dart`

This file contains the `BlogRepositoryImpl` class, which implements the `BlogRepository` interface. It provides methods to perform blog post operations.

#### `lib/features/blog/domain/entities/blog_entity.dart`

This file defines the `BlogEntity` class, which represents a blog post in the domain layer. It includes properties for the blog post's ID, title, content, and author.

#### `lib/features/blog/domain/repository/blog_repository.dart`

This file defines the `BlogRepository` interface, which specifies the methods for blog post operations.

#### `lib/features/blog/domain/usecases/get_all_blogs.dart`

This file contains the `GetAllBlogs` use case, which retrieves all blog posts.

#### `lib/features/blog/domain/usecases/upload_blog.dart`

This file contains the `UploadBlog` use case, which handles uploading a new blog post.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or Xcode (for mobile development)
- An IDE (such as Visual Studio Code or Android Studio)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Engineerbabu777/blog_app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd blog_app
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

### Running the App

1. Start the development server:

   ```bash
   flutter run
   ```

2. Open the app on your device or emulator.

## Usage

1. **Sign Up**: Create a new account using your email and password.
2. **Sign In**: Log in to your account using your email and password.
3. **Create a Blog Post**: Write a new blog post and publish it.
4. **View Blog Posts**: Browse and read blog posts from other users.
5. **Edit a Blog Post**: Update your existing blog posts.
6. **Delete a Blog Post**: Remove your blog posts.

## Testing

To run the tests, use the following command:

```bash
flutter test
```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Detailed Explanation of Clean Architecture

### Introduction to Clean Architecture

Clean Architecture is a software design philosophy introduced by Robert C. Martin (Uncle Bob). It emphasizes the separation of concerns and the independence of the business logic from external frameworks, databases, and UI. The primary goal is to create systems that are:

1. **Easy to Test**: Business logic can be tested without the need for UI, databases, or external services.
2. **Easy to Maintain**: Changes in one part of the system do not affect other parts.
3. **Easy to Understand**: The system's structure is clear and intuitive.
4. **Flexible**: The system can adapt to changes in requirements or technology.

### Layers of Clean Architecture

Clean Architecture divides the system into several concentric layers:

1. **Entities**: The innermost layer contains the business entities (e.g., `User`, `BlogPost`).
2. **Use Cases**: This layer contains the application-specific business rules. It orchestrates the flow of data to and from the entities.
3. **Interface Adapters**: This layer converts data from the format most convenient for the use cases and entities to the format most convenient for external agencies (e.g., databases, web services).
4. **Frameworks and Drivers**: The outermost layer contains the details of the frameworks and tools used to deliver the system (e.g., Flutter, Firebase).

### Dependency Rule

The Dependency Rule is a fundamental principle of Clean Architecture. It states that:

- **Inner layers should not know anything about outer layers**.
- **Dependencies should point inward**.

This ensures that the business logic remains independent of external changes.

### Benefits of Clean Architecture

1. **Separation of Concerns**: Each layer has a specific responsibility, making the system easier to understand and maintain.
2. **Testability**: Business logic can be tested in isolation, without the need for UI or external services.
3. **Flexibility**: The system can adapt to changes in technology or requirements without affecting the core business logic.
4. **Reusability**: Components can be reused across different parts of the system or in different projects.

### Implementation in the Blog App

The Blog App follows Clean Architecture principles to ensure maintainability and scalability. Here's how the layers are implemented:

#### Domain Layer

The Domain Layer contains the business logic and entities. It is the innermost layer and does not depend on any other layer.

- **Entities**: `UserEntity`, `BlogEntity`
- **Use Cases**: `UserSignIn`, `UserSignUp`, `GetAllBlogs`, `UploadBlog`
- **Repositories Interfaces**: `AuthRepository`, `BlogRepository`

#### Data Layer

The Data Layer handles data retrieval and storage. It depends on the Domain Layer but not on the Presentation Layer.

- **Models**: `UserModel`, `BlogModel`
- **Data Sources**: `AuthRemoteDataSource`, `BlogLocalDataSource`, `BlogRemoteDataSource`
- **Repositories Implementations**: `AuthRepositoryImpl`, `BlogRepositoryImpl`

#### Presentation Layer

The Presentation Layer manages the UI and user interactions. It depends on the Domain Layer but not on the Data Layer.

- **Blocs**: `AuthBloc`, `BlogBloc`
- **Pages**: `SignInPage`, `SignUpPage`, `BlogPage`
- **Widgets**: `AuthField`, `AuthGradientButton`, `Loader`

### Example: User Sign-In Flow

1. **Presentation Layer**: The `SignInPage` widget collects the user's email and password and dispatches a `SignInEvent` to the `AuthBloc`.
2. **Domain Layer**: The `AuthBloc` calls the `UserSignIn` use case, which orchestrates the sign-in process.
3. **Data Layer**: The `UserSignIn` use case calls the `AuthRepository` to perform the sign-in operation.
4. **Data Layer**: The `AuthRepositoryImpl` calls the `AuthRemoteDataSource` to communicate with the backend API.
5. **Domain Layer**: The `AuthRemoteDataSource` returns the result to the `AuthRepositoryImpl`, which converts it to a `UserEntity` and returns it to the `UserSignIn` use case.
6. **Presentation Layer**: The `UserSignIn` use case returns the result to the `AuthBloc`, which updates the state and notifies the `SignInPage` to navigate to the home screen.

### Example: Fetching Blog Posts

1. **Presentation Layer**: The `BlogPage` widget dispatches a `FetchBlogsEvent` to the `BlogBloc`.
2. **Domain Layer**: The `BlogBloc` calls the `GetAllBlogs` use case, which orchestrates the fetching process.
3. **Data Layer**: The `GetAllBlogs` use case calls the `BlogRepository` to perform the fetch operation.
4. **Data Layer**: The `BlogRepositoryImpl` calls the `BlogRemoteDataSource` to communicate with the backend API.
5. **Domain Layer**: The `BlogRemoteDataSource` returns the result to the `BlogRepositoryImpl`, which converts it to a list of `BlogEntity` objects and returns it to the `GetAllBlogs` use case.
6. **Presentation Layer**: The `GetAllBlogs` use case returns the result to the `BlogBloc`, which updates the state and notifies the `BlogPage` to display the blog posts.

### Conclusion

Clean Architecture provides a robust foundation for building maintainable and scalable applications. By separating concerns and enforcing the Dependency Rule, the Blog App ensures that its business logic remains independent of external changes, making it easier to test, maintain, and extend.

## Detailed Explanation of Each File

### Core Files

#### `lib/core/common/cubits/app_user/app_user_cubit.dart`

This file contains the `AppUserCubit` class, which is a state management class for the authenticated user. It extends `Cubit` from the `bloc` package and manages the state of the user.

```dart
class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(const AppUserState.initial());

  void updateUser(UserEntity? user) {
    if (user == null) {
      emit(const AppUserState.initial());
    } else {
      emit(AppUserState.authenticated(user));
    }
  }
}
```

- **Purpose**: Manages the state of the authenticated user.
- **Methods**: `updateUser` updates the user state.
- **State**: `AppUserState` represents the state of the user (initial or authenticated).

#### `lib/core/common/cubits/app_user/app_user_state.dart`

This file defines the `AppUserState` class, which represents the state of the authenticated user.

```dart
class AppUserState {
  final UserEntity? user;
  final bool isLoading;

  const AppUserState._({
    required this.user,
    required this.isLoading,
  });

  const AppUserState.initial()
      : this._(user: null, isLoading: false);

  const AppUserState.authenticated(UserEntity user)
      : this._(user: user, isLoading: false);

  AppUserState copyWith({
    UserEntity? user,
    bool? isLoading,
  }) {
    return AppUserState._(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
```

- **Purpose**: Represents the state of the authenticated user.
- **Properties**: `user` (the user entity), `isLoading` (whether the state is loading).
- **Methods**: `copyWith` creates a new state with updated values.

#### `lib/core/common/entities/user_entity.dart`

This file defines the `UserEntity` class, which represents a user in the application.

```dart
class UserEntity {
  final String id;
  final String name;
  final String email;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
  });
}
```

- **Purpose**: Represents a user in the application.
- **Properties**: `id` (user ID), `name` (user name), `email` (user email).

#### `lib/core/common/widgets/loader.dart`

This file contains the `Loader` widget, which displays a loading indicator.

```dart
class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
```

- **Purpose**: Displays a loading indicator.
- **Usage**: Used to show loading states in the UI.

#### `lib/core/constants/constants.dart`

This file contains application-wide constants.

```dart
class Constants {
  static const String apiKey = 'your_api_key';
  static const String baseUrl = 'https://api.example.com';
}
```

- **Purpose**: Stores application-wide constants.
- **Usage**: Used to access constants such as API keys and base URLs.

#### `lib/core/error/exception.dart`

This file defines custom exceptions used in the application.

```dart
class ServerException implements Exception {
  final String message;

  const ServerException(this.message);
}

class CacheException implements Exception {
  final String message;

  const CacheException(this.message);
}
```

- **Purpose**: Defines custom exceptions for server and cache errors.
- **Usage**: Used to handle errors in the data layer.

#### `lib/core/error/failure.dart`

This file defines the `Failure` class, which represents a failure in the application.

```dart
class Failure {
  final String message;
  final StackTrace? stackTrace;

  const Failure(this.message, [this.stackTrace]);
}
```

- **Purpose**: Represents a failure in the application.
- **Properties**: `message` (error message), `stackTrace` (stack trace).

#### `lib/core/network/connection_checker.dart`

This file contains the `ConnectionChecker` class, which checks the device's internet connection status.

```dart
class ConnectionChecker {
  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
```

- **Purpose**: Checks the device's internet connection status.
- **Methods**: `isConnected` returns a boolean indicating whether the device is connected to the internet.

#### `lib/core/theme/app_pallete.dart`

This file defines the application's color palette.

```dart
class AppPalette {
  static const Color primary = Color(0xFF6200EE);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB00020);
}
```

- **Purpose**: Defines the application's color palette.
- **Usage**: Used to access colors in the UI.

#### `lib/core/theme/theme.dart`

This file contains the application's theme definitions.

```dart
final ThemeData lightTheme = ThemeData(
  primaryColor: AppPalette.primary,
  colorScheme: ColorScheme.light(
    primary: AppPalette.primary,
    secondary: AppPalette.secondary,
    background: AppPalette.background,
    surface: AppPalette.surface,
    error: AppPalette.error,
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: AppPalette.primary,
  colorScheme: ColorScheme.dark(
    primary: AppPalette.primary,
    secondary: AppPalette.secondary,
    background: AppPalette.background,
    surface: AppPalette.surface,
    error: AppPalette.error,
  ),
);
```

- **Purpose**: Defines the application's light and dark themes.
- **Usage**: Used to apply themes to the UI.

#### `lib/core/usecase/usecase.dart`

This file defines the base `UseCase` class.

```dart
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
```

- **Purpose**: Defines the base use case class.
- **Usage**: Used to encapsulate business logic.

#### `lib/core/utils/calculate_reading_time.dart`

This file contains the `calculateReadingTime` function.

```dart
String calculateReadingTime(String content) {
  final wordCount = content.split(' ').length;
  final readingTime = wordCount / 200;
  return '${readingTime.ceil()} min read';
}
```

- **Purpose**: Calculates the reading time for a blog post.
- **Usage**: Used to display the reading time in the UI.

#### `lib/core/utils/format_date.dart`

This file contains the `formatDate` function.

```dart
String formatDate(DateTime date) {
  return DateFormat('MMMM d, yyyy').format(date);
}
```

- **Purpose**: Formats a date string into a human-readable format.
- **Usage**: Used to display dates in the UI.

#### `lib/core/utils/pick_image.dart`

This file contains the `pickImage` function.

```dart
Future<File?> pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}
```

- **Purpose**: Allows users to pick an image from their device.
- **Usage**: Used to upload images in the UI.

#### `lib/core/utils/show_snackbar.dart`

This file contains the `showSnackBar` function.

```dart
void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
```

- **Purpose**: Displays a snackbar message in the UI.
- **Usage**: Used to show messages to the user.

### Auth Files

#### `lib/features/auth/data/datasources/auth_remote_data_source.dart`

This file contains the `AuthRemoteDataSource` class.

```dart
class AuthRemoteDataSource {
  Future<UserModel> signIn(String email, String password) async {
    // Implementation
  }

  Future<UserModel> signUp(String name, String email, String password) async {
    // Implementation
  }
}
```

- **Purpose**: Handles remote authentication operations.
- **Methods**: `signIn` and `signUp` perform authentication operations.

#### `lib/features/auth/data/models/user_models.dart`

This file defines the `UserModel` class.

```dart
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
```

- **Purpose**: Represents a user in the data layer.
- **Methods**: `fromJson` and `toJson` convert between the model and JSON.

#### `lib/features/auth/data/repositories/auth_repository_impl.dart`

This file contains the `AuthRepositoryImpl` class.

```dart
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final userModel = await remoteDataSource.signIn(email, password);
    return userModel;
  }

  @override
  Future<UserEntity> signUp(String name, String email, String password) async {
    final userModel = await remoteDataSource.signUp(name, email, password);
    return userModel;
  }
}
```

- **Purpose**: Implements the `AuthRepository` interface.
- **Methods**: `signIn` and `signUp` perform authentication operations.

#### `lib/features/auth/domain/respository/auth_repository.dart`

This file defines the `AuthRepository` interface.

```dart
abstract class AuthRepository {
  Future<UserEntity> signIn(String email, String password);
  Future<UserEntity> signUp(String name, String email, String password);
}
```

- **Purpose**: Specifies the methods for authentication operations.

#### `lib/features/auth/domain/use-cases/current_user.dart`

This file contains the `CurrentUser` use case.

```dart
class CurrentUser implements UseCase<UserEntity, NoParams> {
  final AuthRepository repository;

  CurrentUser(this.repository);

  @override
  Future<UserEntity> call(NoParams params) async {
    return await repository.getCurrentUser();
  }
}
```

- **Purpose**: Retrieves the currently authenticated user.

#### `lib/features/auth/domain/use-cases/user_sign_in.dart`

This file contains the `UserSignIn` use case.

```dart
class UserSignIn implements UseCase<UserEntity, SignInParams> {
  final AuthRepository repository;

  UserSignIn(this.repository);

  @override
  Future<UserEntity> call(SignInParams params) async {
    return await repository.signIn(params.email, params.password);
  }
}
```

- **Purpose**: Handles user sign-in operations.

#### `lib/features/auth/domain/use-cases/user_sign_up.dart`

This file contains the `UserSignUp` use case.

```dart
class UserSignUp implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository repository;

  UserSignUp(this.repository);

  @override
  Future<UserEntity> call(SignUpParams params) async {
    return await repository.signUp(params.name, params.email, params.password);
  }
}
```

- **Purpose**: Handles user sign-up operations.

#### `lib/features/auth/presentation/bloc/auth_bloc.dart`

This file contains the `AuthBloc` class.

```dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignIn userSignIn;
  final UserSignUp userSignUp;

  AuthBloc({
    required this.userSignIn,
    required this.userSignUp,
  }) : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await userSignIn(SignInParams(
        email: event.email,
        password: event.password,
      ));
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await userSignUp(SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ));
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
```

- **Purpose**: Manages the state of the authentication feature.
- **Methods**: `_onSignIn` and `_onSignUp` handle sign-in and sign-up events.

#### `lib/features/auth/presentation/bloc/auth_event.dart`

This file defines the `AuthEvent` class.

```dart
abstract class AuthEvent {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}
```

- **Purpose**: Represents events in the authentication feature.

#### `lib/features/auth/presentation/bloc/auth_state.dart`

This file defines the `AuthState` class.

```dart
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;

  const AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);
}
```

- **Purpose**: Represents the state of the authentication feature.

#### `lib/features/auth/presentation/pages/signin_page.dart`

This file contains the `SignInPage` widget.

```dart
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: BlocProvider(
        create: (context) => AuthBloc(
          userSignIn: context.read<UserSignIn>(),
          userSignUp: context.read<UserSignUp>(),
        ),
        child: const SignInForm(),
      ),
    );
  }
}
```

- **Purpose**: Displays the sign-in screen.

#### `lib/features/auth/presentation/pages/signup_page.dart`

This file contains the `SignUpPage` widget.

```dart
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: BlocProvider(
        create: (context) => AuthBloc(
          userSignIn: context.read<UserSignIn>(),
          userSignUp: context.read<UserSignUp>(),
        ),
        child: const SignUpForm(),
      ),
    );
  }
}
```

- **Purpose**: Displays the sign-up screen.

#### `lib/features/auth/presentation/widgets/auth_field.dart`

This file contains the `AuthField` widget.

```dart
class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
```

- **Purpose**: A reusable text field for authentication forms.

#### `lib/features/auth/presentation/widgets/auth_gradient_button.dart`

This file contains the `AuthGradientButton` widget.

```dart
class AuthGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPalette.primary,
        foregroundColor: Colors.white,
      ),
      child: Text(text),
    );
  }
}
```

- **Purpose**: A reusable button for authentication forms.

### Blog Files

#### `lib/features/blog/data/datasources/blog_local_datasource.dart`

This file contains the `BlogLocalDataSource` class.

```dart
class BlogLocalDataSource {
  Future<List<BlogModel>> getCachedBlogs() async {
    // Implementation
  }

  Future<void> cacheBlogs(List<BlogModel> blogs) async {
    // Implementation
  }
}
```

- **Purpose**: Handles local blog post operations.

#### `lib/features/blog/data/datasources/blog_remote_datasource.dart`

This file contains the `BlogRemoteDataSource` class.

```dart
class BlogRemoteDataSource {
  Future<List<BlogModel>> getBlogs() async {
    // Implementation
  }

  Future<BlogModel> uploadBlog(BlogModel blog) async {
    // Implementation
  }
}
```

- **Purpose**: Handles remote blog post operations.

#### `lib/features/blog/data/models/blog_model.dart`

This file defines the `BlogModel` class.

```dart
class BlogModel extends BlogEntity {
  const BlogModel({
    required super.id,
    required super.title,
    required super.content,
    required super.author,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      author: json['author'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author': author,
    };
  }
}
```

- **Purpose**: Represents a blog post in the data layer.

#### `lib/features/blog/data/repositories/blog_repository_impl.dart`

This file contains the `BlogRepositoryImpl` class.

```dart
class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource remoteDataSource;
  final BlogLocalDataSource localDataSource;

  BlogRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<BlogEntity>> getBlogs() async {
    try {
      final blogs = await remoteDataSource.getBlogs();
      await localDataSource.cacheBlogs(blogs);
      return blogs;
    } catch (e) {
      final cachedBlogs = await localDataSource.getCachedBlogs();
      return cachedBlogs;
    }
  }

  @override
  Future<BlogEntity> uploadBlog(BlogEntity blog) async {
    final blogModel = BlogModel(
      id: blog.id,
      title: blog.title,
      content: blog.content,
      author: blog.author,
    );
    final uploadedBlog = await remoteDataSource.uploadBlog(blogModel);
    return uploadedBlog;
  }
}
```

- **Purpose**: Implements the `BlogRepository` interface.

#### `lib/features/blog/domain/entities/blog_entity.dart`

This file defines the `BlogEntity` class.

```dart
class BlogEntity {
  final String id;
  final String title;
  final String content;
  final String author;

  const BlogEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
  });
}
```

- **Purpose**: Represents a blog post in the domain layer.

#### `lib/features/blog/domain/repository/blog_repository.dart`

This file defines the `BlogRepository` interface.

```dart
abstract class BlogRepository {
  Future<List<BlogEntity>> getBlogs();
  Future<BlogEntity> uploadBlog(BlogEntity blog);
}
```

- **Purpose**: Specifies the methods for blog post operations.

#### `lib/features/blog/domain/usecases/get_all_blogs.dart`

This file contains the `GetAllBlogs` use case.

```dart
class GetAllBlogs implements UseCase<List<BlogEntity>, NoParams> {
  final BlogRepository repository;

  GetAllBlogs(this.repository);

  @override
  Future<List<BlogEntity>> call(NoParams params) async {
    return await repository.getBlogs();
  }
}
```

- **Purpose**: Retrieves all blog posts.

#### `lib/features/blog/domain/usecases/upload_blog.dart`

This file contains the `UploadBlog` use case.

```dart
class UploadBlog implements UseCase<BlogEntity, BlogParams> {
  final BlogRepository repository;

  UploadBlog(this.repository);

  @override
  Future<BlogEntity> call(BlogParams params) async {
    return await repository.uploadBlog(params.blog);
  }
}
```

- **Purpose**: Handles uploading a new blog post.

## Conclusion

The Blog App is a comprehensive Flutter application built using Clean Architecture principles. It provides a robust foundation for creating, reading, and managing blog posts while ensuring maintainability, scalability, and testability. This README provides a detailed overview of the project's structure, architecture, and implementation, making it easier for developers to understand and contribute to the project.

## Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Bloc Library Documentation](https://bloclibrary.dev/)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter Team
- Clean Architecture Community
- Bloc Library Contributors

## Contact

For any questions or feedback, please contact:

- Email: support@blogapp.com
- GitHub: [Blog App Repository](https://github.com/Engineerbabu777/blog_app)

## Changelog

### Version 1.0.0

- Initial release of the Blog App.
- Features: User Authentication, Blog Post Management.
- Architecture: Clean Architecture, Bloc State Management.

### Version 1.1.0

- Added offline support for blog posts.
- Improved UI and user experience.
- Bug fixes and performance improvements.

## Future Enhancements (SOON)

- Social sharing for blog posts.
- Comments and likes for blog posts.
- User profiles and settings.
- Advanced search and filtering.

## Support

For support, please open an issue on the [GitHub Repository](https://github.com/Engineerbabu777/blog_app/issues).

## Contributors

- Awais
- Flutter Community

## Sponsors

- Flutter
- Dart
- Clean Architecture Community

## Donations

If you find this project helpful, consider donating to support its development:

- [GitHub Sponsors](https://github.com/sponsors/Engineerbabu777)
- [PayPal](https://paypal.me/Engineerbabu777)

## Stargazers

Thank you to all the stargazers for your support!

## Forks

Thank you to all the forks for your contributions!

## Issues

Please report any issues or bugs on the [GitHub Repository](https://github.com/Engineerbabu777/blog_app/issues).

## Pull Requests

Pull requests are welcome! Please follow the contributing guidelines.
