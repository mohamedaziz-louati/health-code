# Health Code

A mobile app made with Flutter that helps patients find doctors and book appointments, simplifying the process of managing healthcare needs and improving access to medical professionals.

## Features

- **User Authentication**: Secure login and registration system
- **Doctor Search**: Find doctors by specialization, location, and availability
- **Appointment Booking**: Easy appointment scheduling with real-time availability
- **Appointment Management**: View, cancel, and reschedule appointments
- **User Profile**: Manage personal information and preferences
- **Modern UI**: Beautiful and intuitive user interface

## Screenshots

The app features a clean, modern design with:
- Splash screen with Health Code branding
- Intuitive navigation with bottom tab bar
- Doctor search with filtering capabilities
- Appointment booking with date/time selection
- Profile management
- Responsive design for various screen sizes

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio or VS Code
- Android device or emulator

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd healthcode
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── user.dart
│   ├── doctor.dart
│   └── appointment.dart
├── providers/                 # State management
│   ├── auth_provider.dart
│   ├── doctor_provider.dart
│   └── appointment_provider.dart
├── screens/                  # UI screens
│   ├── splash_screen.dart
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── register_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── doctors/
│   │   ├── doctor_search_screen.dart
│   │   └── doctor_detail_screen.dart
│   ├── appointments/
│   │   ├── appointments_screen.dart
│   │   ├── appointment_detail_screen.dart
│   │   └── book_appointment_screen.dart
│   └── profile/
│       └── profile_screen.dart
├── widgets/                   # Reusable widgets
│   ├── home_widgets.dart
│   ├── doctor_widgets.dart
│   └── appointment_widgets.dart
└── theme/
    └── app_theme.dart        # App theming
```

## Dependencies

- **provider**: State management
- **http**: HTTP requests
- **shared_preferences**: Local storage
- **intl**: Internationalization
- **cached_network_image**: Image caching
- **flutter_rating_bar**: Rating display
- **date_picker_timeline**: Date selection
- **flutter_staggered_animations**: Animations

## Features in Detail

### Authentication
- User registration and login
- Secure session management
- Profile information storage

### Doctor Search
- Search by name, specialization, or hospital
- Filter by medical specialties
- View doctor profiles with ratings and reviews
- Check availability and consultation fees

### Appointment Booking
- Select date and time from available slots
- Add notes for the appointment
- Real-time booking confirmation
- Integration with doctor availability

### Appointment Management
- View upcoming and past appointments
- Cancel appointments
- Reschedule functionality (planned)
- Detailed appointment information

### User Profile
- View and edit personal information
- Settings and preferences
- Help and support
- Logout functionality

## Future Enhancements

- Push notifications for appointment reminders
- Video consultation integration
- Prescription management
- Health records storage
- Multi-language support
- Dark mode theme
- Offline functionality

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please contact the development team or create an issue in the repository.
