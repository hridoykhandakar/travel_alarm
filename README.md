# 🌍 Travel Alarm App

<div align="center">
  <img src="assets/images/location_image.png" alt="Travel Alarm App" width="200" height="200"/>
  
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
  [![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://developer.android.com/)
  [![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)](https://developer.apple.com/ios/)

**A smart travel companion that helps you stay on schedule with location-based alarms**

</div>

## 📱 Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="assets/images/onboarding01.png" alt="Onboarding Screen 1" width="200"/>
        <br><b>Onboarding - Discover</b>
      </td>
      <td align="center">
        <img src="assets/images/onboarding02.png" alt="Onboarding Screen 2" width="200"/>
        <br><b>Onboarding - Explore</b>
      </td>
      <td align="center">
        <img src="assets/images/location_image.png" alt="Location Screen" width="200"/>
        <br><b>Location Selection</b>
      </td>
    </tr>
  </table>
</div>

## ✨ Features

- 🎯 **Smart Onboarding** - Intuitive user introduction with smooth page transitions
- 📍 **Location Services** - Get current location or set custom location for alarms
- ⏰ **Alarm Management** - Create, edit, and manage multiple alarms
- 🎨 **Modern UI** - Beautiful dark theme with gradient backgrounds
- 📱 **Cross-Platform** - Works seamlessly on Android and iOS
- 🔔 **Rich Notifications** - Customizable alarm notifications with sound
- 💾 **Local Storage** - Persistent data storage using Hive
- 🎵 **Custom Audio** - Personalized alarm sounds

## 🏗️ Architecture

This project follows **Clean Architecture** principles with feature-based organization:

```
lib/
├── features/                    # Feature-based modules
│   ├── alarm/                  # Alarm management feature
│   │   ├── screens/           # UI screens
│   │   ├── services/          # Business logic
│   │   ├── widgets/           # Reusable components
│   │   └── providers/         # State management
│   ├── location/              # Location services feature
│   ├── onboarding/            # User onboarding feature
│   └── splash/                # App initialization
├── common_widgets/            # Shared UI components
├── constants/                 # App constants and themes
├── helpers/                   # Utility functions
└── main.dart                  # App entry point
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.8.1+
- **Language**: Dart
- **State Management**: Riverpod
- **Local Storage**: Hive
- **Location Services**: Geolocator & Geocoding
- **Alarms**: Alarm package
- **UI**: Material 3 with custom theming
- **Icons**: Flutter SVG
- **Internationalization**: Intl

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code with Flutter extensions
- iOS Simulator (for iOS development) / Android Emulator

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/travel_alarm.git
   cd travel_alarm
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

**Android APK:**

```bash
flutter build apk --release
```

**iOS:**

```bash
flutter build ios --release
```

## 📋 Features Overview

### 🎯 Onboarding Experience

- Smooth page transitions with custom indicators
- Engaging content with beautiful illustrations
- Skip functionality for returning users
- Persistent onboarding state management

### 📍 Location Services

- **Current Location**: Automatically detect user's location
- **Manual Selection**: Choose custom location
- **Permission Handling**: Graceful permission requests
- **Error Handling**: User-friendly error messages

### ⏰ Alarm Management

- **Create Alarms**: Date and time picker integration
- **Toggle Alarms**: Easy on/off functionality
- **Visual Feedback**: Clear alarm status indicators
- **Custom Sounds**: Personalized alarm audio
- **Notifications**: Rich notification support

### 🎨 User Interface

- **Dark Theme**: Modern dark mode design
- **Gradient Backgrounds**: Beautiful visual effects
- **Custom Components**: Reusable UI elements
- **Responsive Design**: Adapts to different screen sizes
- **Smooth Animations**: Enhanced user experience

## 🔧 Configuration

### Location Permissions

**Android** (`android/app/src/main/AndroidManifest.xml`):

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

**iOS** (`ios/Runner/Info.plist`):

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs location access to set location-based alarms.</string>
```

### Alarm Permissions

**Android** (`android/app/src/main/AndroidManifest.xml`):

```xml
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="android.permission.VIBRATE" />
<uses-permission android:name="android.permission.USE_FULL_SCREEN_INTENT" />
```

## 🧪 Testing

Run tests to ensure everything works correctly:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## 📦 Dependencies

### Core Dependencies

- `flutter_riverpod: ^3.0.0` - State management
- `hive: ^2.2.3` - Local database
- `hive_flutter: ^1.1.0` - Hive Flutter integration

### Feature Dependencies

- `alarm: ^5.1.5` - Alarm functionality
- `geolocator: ^14.0.2` - Location services
- `geocoding: ^4.0.0` - Geocoding services
- `flutter_local_notifications: ^19.4.2` - Local notifications

### UI Dependencies

- `flutter_svg: ^2.2.1` - SVG support
- `smooth_page_indicator: ^1.2.1` - Page indicators
- `intl: ^0.20.2` - Internationalization

## 🎨 Design System

### Colors

- **Primary**: `#5200FF` (Purple)
- **Background**: Gradient from `#0B0024` to `#082257`
- **White**: `#FFFFFF`
- **Text**: `#E0E0E0` (Light Gray)

### Typography

- **Font Family**: Roboto
- **Headings**: 28px, 600 weight
- **Body**: 16px, 400 weight
- **Captions**: 14px, 400 weight

## 🚀 Future Enhancements

- [ ] **Weather Integration** - Weather-based alarm suggestions
- [ ] **Travel Modes** - Different alarm modes for different travel types
- [ ] **Social Features** - Share alarms with travel companions
- [ ] **Offline Support** - Work without internet connection
- [ ] **Smart Suggestions** - AI-powered alarm recommendations
- [ ] **Multiple Languages** - Internationalization support
- [ ] **Widgets** - Home screen widgets for quick access

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod team for excellent state management
- All open-source contributors whose packages made this project possible

---

<div align="center">
  <p>Made with ❤️ and Flutter</p>
</div>
