# Zamaan: Simple Todo App in Flutter

Welcome to Zamaan! This project is a comprehensive example of a Flutter application that leverages various state management techniques, testing frameworks, and architectural patterns to create a robust and scalable solution. Below, you’ll find an overview of the key features and technologies used in this app.

## Features

* **Task Management** : Add, edit, delete, and mark tasks as completed.
* **Authentication** : Secure user authentication and management.
* **State Management** : Utilizes Provider and BLoC for efficient state management.
* **Testing** : Includes unit tests, widget tests, and integration tests using Mocktail and bloc_test.
* **Architecture** : Implements MVVM (Model-View-ViewModel) pattern and Clean Architecture principles.
* **User Interface** : A clean and intuitive UI built with Flutter’s Material Design components.

## Technologies and Patterns

### Provider

Provider is used for dependency injection and state management. It allows for a clean separation of concerns and makes the app more modular and testable.

### BLoC (Business Logic Component)

BLoC is used to manage the state of the application. It helps in separating the business logic from the UI, making the app more maintainable and scalable.

### Mocktail and bloc_test

Mocktail is used for writing unit tests and mocking dependencies, while bloc_test is used specifically for testing BLoC state management. These tools ensure that the app’s components are tested in isolation, leading to more reliable and bug-free code.

### MVVM Pattern

The app follows the MVVM pattern, which separates the UI (View) from the business logic (ViewModel) and the data (Model). This makes the codebase more organized and easier to maintain.

### Clean Architecture

Clean Architecture principles are applied to ensure a clear separation of concerns and to make the app more scalable and maintainable. The architecture is divided into several layers:

### Authentication Module

* **Presentation Layer** :
* **UI** : Handles the user interface for authentication.
* **State Management** : Manages the state of authentication-related components.
* **Domain Layer** :
* **Entities** : Defines the core data structures.
* **Use Cases** : Contains the business logic for authentication.
* **Repositories** : Interfaces for data access.
* **Data Layer** :
* **Models** : Data models for authentication.
* **Repositories (Implementations)** : Concrete implementations of the repositories.
* **Data Sources** :
  * **Local** : Local data storage using Hive.
  * **Remote** : Remote data access.

### Task Management Module

* **Presentation Layer** :
* **UI** : Handles the user interface for task management.
* **State Management** : Manages the state of task-related components.
* **Domain Layer** :
* **Entities** : Defines the core data structures.
* **Use Cases** : Contains the business logic for task management.
* **Repositories (Interfaces)** : Interfaces for data access.
* **Data Layer** :
* **Models** : Data models for tasks.
* **Repositories (Implementations)** : Concrete implementations of the repositories.
* **Data Sources** :
  * **Local** : Local data storage using Hive.
  * **Remote** : Remote data access.

### Core Module

* **Datasource** :
* **Abstract Definitions** : Defines the abstract classes for remote and Hive data sources.
* **Error** :
* **Custom Errors and Exceptions** : Defines custom error classes and exceptions.
* **Usecases** :
* **Abstract Usecases** : Defines abstract use cases with parameters and without parameters.
* **Utils** :
* **Constants, Enums, Extensions, etc.** : Contains utility classes, constants, enums, and extensions.

## Project Structure

The project is organized into several directories, each serving a specific purpose:

* **lib** : Contains the main application code.
* **core** : Contains core functionalities and utilities.
  * **datasource** : Abstract definitions of remote and Hive data sources.
  * **error** : Custom errors and exceptions.
  * **usecases** : Abstract use cases with parameters and without parameters.
  * **utils** : Constants, enums, extensions, and other utilities.
* **models** : Contains the data models.
* **viewmodels** : Contains the ViewModels.
* **views** : Contains the UI components.
* **utils** : Contains utility classes and functions.
* **test** : Contains the unit tests, widget tests, and integration tests.

## Dependencies

Here are the badges for the dependencies used in this project:

- [![cached_network_image](https://img.shields.io/pub/v/cached_network_image)](https://pub.dev/packages/cached_network_image) `cached_network_image`
- [![cupertino_icons](https://img.shields.io/pub/v/cupertino_icons)](https://pub.dev/packages/cupertino_icons) `cupertino_icons`
- [![dartz](https://img.shields.io/pub/v/dartz)](https://pub.dev/packages/dartz) `dartz`
- [![dotted_line](https://img.shields.io/pub/v/dotted_line)](https://pub.dev/packages/dotted_line) `dotted_line`
- [![equatable](https://img.shields.io/pub/v/equatable)](https://pub.dev/packages/equatable) `equatable`
- [![flutter_bloc](https://img.shields.io/pub/v/flutter_bloc)](https://pub.dev/packages/flutter_bloc) `flutter_bloc`
- [![font_awesome_flutter](https://img.shields.io/pub/v/font_awesome_flutter)](https://pub.dev/packages/font_awesome_flutter) `font_awesome_flutter`
- [![ftoast](https://img.shields.io/pub/v/ftoast)](https://pub.dev/packages/ftoast) `ftoast`
- [![get_it](https://img.shields.io/pub/v/get_it)](https://pub.dev/packages/get_it) `get_it`
- [![hive](https://img.shields.io/pub/v/hive)](https://pub.dev/packages/hive) `hive`
- [![hive_flutter](https://img.shields.io/pub/v/hive_flutter)](https://pub.dev/packages/hive_flutter) `hive_flutter`
- [![iconly](https://img.shields.io/pub/v/iconly)](https://pub.dev/packages/iconly) `iconly`
- [![intl](https://img.shields.io/pub/v/intl)](https://pub.dev/packages/intl) `intl`
- [![path_provider](https://img.shields.io/pub/v/path_provider)](https://pub.dev/packages/path_provider) `path_provider`
- [![persian_datetime_picker](https://img.shields.io/pub/v/persian_datetime_picker)](https://pub.dev/packages/persian_datetime_picker) `persian_datetime_picker`
- [![provider](https://img.shields.io/pub/v/provider)](https://pub.dev/packages/provider) `provider`
- [![shamsi_date](https://img.shields.io/pub/v/shamsi_date)](https://pub.dev/packages/shamsi_date) `shamsi_date`
- [![smooth_page_indicator](https://img.shields.io/pub/v/smooth_page_indicator)](https://pub.dev/packages/smooth_page_indicator) `smooth_page_indicator`
- [![uuid](https://img.shields.io/pub/v/uuid)](https://pub.dev/packages/uuid) `uuid`
- [![bloc_test](https://img.shields.io/pub/v/bloc_test)](https://pub.dev/packages/bloc_test) `bloc_test`

## Getting Started

To get started with Zamaan, follow these steps:

1. **Clone the repository** :

```bash
   git clone https://github.com/TheNullest/zamaan.git
```

## Contributing

Contributions are welcome! If you have any suggestions or improvements, feel free to open an issue or submit a pull request.

## ThankYou 😎👍

Thank you for checking out Zamaan! We hope you find it useful and educational. If you have any questions or feedback, please don’t hesitate to reach out.

Happy coding! 🚀
