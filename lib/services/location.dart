import 'dart:ffi';

import 'package:geolocator/geolocator.dart';
class Location{
  double? latitude;
  double? longitude;

  Location({ this.latitude, this.longitude});

  Future <void> getCurrentLocation()async{
    try{
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();{
        if (!serviceEnabled){
          print("Location is disabled");
          return;
        }
        LocationPermission permission = await Geolocator.checkPermission();{
          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
              print("Location permission is permanently denied");
              return;
            }
          }
          if (permission == LocationPermission.deniedForever){
            print("Location permissions are permanently denied");
            return;
          }
          const LocationSettings locationSettings = LocationSettings(
            accuracy: LocationAccuracy.low,
            distanceFilter: 100,
          );
          Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
          latitude = position.latitude;
          longitude = position.longitude;
        }
      }
    }catch (e){
      print("Error occurred $e");
    }
  }

}