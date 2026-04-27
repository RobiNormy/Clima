import 'package:clima/services/location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
const API_KEY  = '79bcfe52e9f31fc2af97d84032ba1caf';
const theUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {

  Future <dynamic> getCityWeather(String cityName)async{
    var url  = "$theUrl?q=$cityName&appid=$API_KEY&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future <dynamic> getLocationWeather() async{

    Location myLocation = Location();
    await myLocation.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper("$theUrl?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$API_KEY&units=metric");
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
