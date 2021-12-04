// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


import 'package:http/http.dart' as http;


class CommerceController extends GetxController {
  var client = http.Client();
  CommerceController();
  String name, photo, phone;
}
