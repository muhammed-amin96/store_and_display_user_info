# Store and Display User Info App

This Flutter application allows users to store personal information (name, age, and hobby) in a Firebase Firestore database and display the stored information in a list view.

## Features

- Save user information (name, age, hobby) to Firebase Firestore.
- Retrieve and display all stored user information in a list.

## Project Structure

### Main Components

- **`main.dart`**: Initializes Firebase and sets up the app's entry point.
- **`HomeScreen`**: The main screen where users can enter and save their information, as well as navigate to view the stored data.
- **`UsersFirebaseData`**: Displays a list of users fetched from Firebase Firestore.
- **`User` Model**: Represents the user data structure and provides serialization/deserialization methods.
- **`UserService`**: Handles fetching user data from Firebase Firestore.

### Firebase Integration

- **Firestore**: Used to store user data in a "users" collection.
- **Firebase Initialization**: Done using `firebase_core` with configuration in `firebase_options.dart`.

## Prerequisites

1. **Flutter**: Ensure Flutter SDK is installed.
2. **Firebase Setup**:
    - Add your Firebase project to the app.
    - Configure `firebase_options.dart` using the Firebase CLI or FlutterFire CLI.

## How to Use

1. Launch the app, and you'll see the **Home Screen**.
2. Fill in the **Name**, **Age**, and **Hobby** fields and press **Save** to store the data in Firestore.
3. To view all stored data, press the **Display Data** button. This navigates to the `UsersFirebaseData` screen, which lists all user information stored in the database.

## Dependencies

- `flutter`: Flutter framework.
- `firebase_core`: For Firebase initialization.
- `cloud_firestore`: For Firestore database operations.