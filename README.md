# Mobile App Documentation

## Overview
This mobile application provides essential features such as user authentication (login, logout, registration), data fetching from APIs, and a splash screen for enhanced user experience. It is built using the Flutter framework and leverages Firebase for backend services. GetX is utilized for state management and navigation, ensuring a seamless and responsive app experience.

## Features
- **Splash Screen**: Displays an introductory screen while the app is loading.
- **User Authentication**:
  - Login: Secure user login functionality.
  - Logout: Safe logout to protect user data.
  - Registration: Allows new users to create accounts.
- **Fetch API**: Retrieves and displays data from external APIs.

## Tools and Technologies
- **Framework**: Flutter
- **Navigation & State Management**: GetX
- **Database**: Firebase

## Screenshots
Add screenshots of each page below:

### 1. Splash Screen
![Splash Screen]("finalprojectflutter/about me.png")

### 2. Login Page
![Login Page](path/to/login_page.png)

### 3. Registration Page
![Registration Page](path/to/registration_page.png)

### 4. Home Page (API Data)
![Home Page](path/to/home_page.png)

### 5. Logout
![Logout Screen](path/to/logout_screen.png)

## Installation
Follow the steps below to set up and run the application:

1. **Clone the Repository**:
   ```bash
   git clone <repository_url>
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd <project_directory>
   ```

3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

4. **Set Up Firebase**:
   - Create a Firebase project.
   - Add the `google-services.json` file (for Android) and `GoogleService-Info.plist` file (for iOS) to the respective directories.
   - Enable Authentication and configure Firestore or Realtime Database as required.

5. **Run the Application**:
   ```bash
   flutter run
   ```

## Folder Structure
```
lib/
|-- main.dart
|-- bindings/
|   |-- app_bindings.dart
|-- controllers/
|   |-- auth_controller.dart
|   |-- api_controller.dart
|-- models/
|   |-- user_model.dart
|-- screens/
|   |-- splash_screen.dart
|   |-- login_screen.dart
|   |-- registration_screen.dart
|   |-- home_screen.dart
|-- services/
|   |-- api_service.dart
|   |-- firebase_service.dart
|-- widgets/
|   |-- common_widgets.dart
```

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

