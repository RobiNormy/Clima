# Clima 🌤️

A Flutter weather application that provides real-time weather information based on user location or searched cities.

## Features

- **Current Location Weather** - Automatically fetches weather data for your current GPS location
- **City Search** - Search weather information for any city worldwide
- **Temperature Display** - Show current temperature in Celsius
- **Weather Conditions** - Display current weather conditions (sunny, cloudy, rainy, etc.)
- **Humidity & Wind Speed** - Additional weather metrics
- **Dark Theme UI** - Modern dark-themed interface

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/
│   ├── loading_screen.dart   # Splash/loading screen
│   ├── location_screen.dart  # Weather by current location
│   └── city_screen.dart      # Weather by city search
├── services/
│   ├── location.dart         # GPS location service
│   ├── networking.dart       # API HTTP requests
│   └── weather.dart          # Weather data model
└── utilities/
    └── constants.dart        # App constants (API keys, URLs)
```

## Prerequisites

- Flutter SDK (latest version)
- OpenWeatherMap API key
- Android SDK / Xcode (for iOS)

## Configuration

1. Get a free API key from [OpenWeatherMap](https://openweathermap.org/api)
2. Create a `.env` file in the project root:
   ```
   API_KEY=your_openweathermap_api_key
   ```
3. Or update the `constants.dart` file directly with your API key

## Building

### Debug APK
```bash
flutter build apk --debug
```

### Release APK
```bash
flutter build apk --release
```

### iOS (macOS only)
```bash
flutter build ios
```

## Dependencies

- `geolocator` - GPS location services
- `http` - HTTP networking
- `flutter_spinkit` - Loading animations

## License

This project is for educational purposes.
