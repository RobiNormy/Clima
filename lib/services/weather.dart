import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        "${dotenv.get('THE_URL')}?q=$cityName&appid=${dotenv.get('API_KEY')}&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
      "${dotenv.get('THE_URL')}?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=${dotenv.get('API_KEY')}&units=metric",
    );
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return ' 🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
