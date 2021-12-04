 import 'package:geocode/geocode.dart';
import 'package:location/location.dart';
 import 'package:flutter/services.dart';

getUserLocation() async {//call this async method from whereever you need
    
      LocationData myLocation;
      String error;
      Location location =  Location();
      try {
        myLocation = await location.getLocation();
      } on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          error = 'please grant permission';
          print(error);
        }
        if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
          error = 'permission denied- please enable it from app settings';
          print(error);
        }
        myLocation = null!;
      }
     GeoCode geoCode = GeoCode();

  try {
    Coordinates coordinates = await geoCode.forwardGeocoding(
        address: "532 S Olive St, Los Angeles, CA 90013");
    print("Latitude: ${coordinates.latitude}");
    print("Longitude: ${coordinates.longitude}");
  } catch (e) {
    print(e);
  }
    }