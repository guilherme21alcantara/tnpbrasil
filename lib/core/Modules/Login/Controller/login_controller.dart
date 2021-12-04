// @dart=2.9
import 'dart:convert';
import 'package:geocoding/geocoding.dart' as T;
import 'package:quiver/iterables.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:estados_municipios/estados_municipios.dart';
//import 'package:geocoder/geocoder.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as L; 
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

class LoginController extends GetxController {
  final SingupController id = Get.put(SingupController());
  //final teste = ApiBase();
  var client = http.Client();
  GeoCode geoCode = GeoCode();
  Location location = Location();
  LoginController();
  List a = [];

  
  //List SP = range(19, 52.02).toList();

  final controllerE = EstadosMunicipiosController();

  var loginProcess = false.obs;
  TextEditingController emailController, passwordController, emailc, passc, e, p;
  var email = '';
  var password = '';
  bool test;
  String local;
  String uf;
  String uf2;
  bool sav;
  @override
  void onInit() {
    super.onInit();

    e = TextEditingController();
    p = TextEditingController();
    emailc = TextEditingController();
    passc = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    test = true;
    sav;
  }

  validateEmail() {
  }

  String validatePassword(String value) {
    if (value.length != 6) {}
    return null;
  }

  bool obscurePassword() {
    test = false;
    update();
  }

  getUserLocation() async {
    //call this async method from whereever you need
    final estados = await controllerE.buscaTodosEstados();
    
    String error;
    Location location = Location();
    

bool _serviceEnabled;
PermissionStatus _permissionGranted;
LocationData _locationData;

  _permissionGranted = await location.requestPermission();

_locationData = await location.getLocation();

  

    var addresses = await geoCode.reverseGeocoding(
        latitude: _locationData.latitude, longitude: _locationData.longitude);
    // a.add(estados);
    local = addresses.city;
   List c= await  L
   .placemarkFromCoordinates(_locationData.latitude, _locationData.longitude);
  T. Placemark placeMark  = c[0]; 
  String name = placeMark.name;
  String subLocality = placeMark.subLocality;
  String locality = placeMark.locality;
  String administrativeArea = placeMark.administrativeArea;
  String postalCode = placeMark.postalCode;
  String country = placeMark.country;
  String address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
  print(address);
  if (administrativeArea == 'Acre')
  {
    uf2 = 'ac';
  }
  if (administrativeArea == 'Alagoas')
  {
    uf2 = 'al';
  }
  if (administrativeArea == 'Amazonas')
  {
    uf2 = 'am';
  }
  if (administrativeArea == 'Amapá')
  {
    uf2 = 'ap';
  }
  if (administrativeArea == 'Bahia')
  {
    uf2 = 'ba';
  }
  if (administrativeArea == 'Ceará')
  {
    uf2 = 'ce';
  }
  if (administrativeArea == 'Distrito Federal')
  {
    uf2 = 'df';
  }
  if (administrativeArea == 'Espírito Santo')
  {
    uf2 = 'es';
  }
  if (administrativeArea == 'Goiás')
  {
    uf2 = 'go';
  }
  if (administrativeArea == 'Maranhão')
  {
    uf2 = 'ma';
  }
  if (administrativeArea == 'Minas Gerais')
  {
    uf2 = 'mg';
  }
  if (administrativeArea == 'Mato Grosso do Sul')
  {
    uf2 = 'ms';
  }
  if (administrativeArea == 'Mato Grosso')
  {
    uf2 = 'mt';
  }
  if (administrativeArea == 'Pará')
  {
    uf2 = 'pa';
  }
  if (administrativeArea == 'Pará')
  {
    uf2 = 'pb';
  }
  if (administrativeArea == 'Pernambuco')
  {
    uf2 = 'pe';
  }
  if (administrativeArea == 'Piauí')
  {
    uf2 = 'pi';
  }
  if (administrativeArea == 'Paraná')
  {
    uf2 = 'pr';
  }
  if (administrativeArea == 'Rio de Janeiro')
  {
    uf2 = 'rj';
  }
  if (administrativeArea == 'Rio Grande do Norte')
  {
    uf2 = 'rn';
  }
  if (administrativeArea == 'Rondônia')
  {
    uf2 = 'ro';
  }
  if (administrativeArea == 'Roraima')
  {
    uf2 = 'rr';
  }
  if (administrativeArea == 'Rio Grande do Sul')
  {
    uf2 = 'rs';
  }
  if (administrativeArea == 'Santa Catarina')
  {
    uf2 = 'sc';
  }
  if (administrativeArea == 'Sergipe')
  {
    uf2 = 'se';
  }
  if (administrativeArea == 'São Paulo')
  {
    uf2 = 'sp';
  }

  if (administrativeArea == 'Tocantins')
  {
    uf2 = 'to';
  }
  
  print(administrativeArea);
  
}}
