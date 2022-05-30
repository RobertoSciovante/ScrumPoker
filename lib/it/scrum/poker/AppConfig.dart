// ignore_for_file: prefer_expression_function_bodies, public_member_api_docs, diagnostic_describe_all_properties

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

class Flavor {
  Flavor._internal(this.name, this.color) {
    // values.add(this);
  }

  static final Flavor DEV = Flavor._internal('dev', Colors.amber);
  static final Flavor TEST = Flavor._internal('test', Colors.blue);
  static final Flavor PROD = Flavor._internal('prod', Colors.teal);
  static List<Flavor> values = [DEV, TEST, PROD];

  static Flavor? valueOf(String name) {
    for (var element in values) {
      if (element.name == name) {
        return element;
      }
    }
    return null;
  }

  final String name;
  final Color color;
}

class AppConfig {
  // factory AppConfig() {
  //   return _singleton;
  // }
  // static _AppConfig get AppConfig => _singleton;
  //
  // _AppConfig._internal() ;
  //
  // static final _AppConfig _singleton = _AppConfig._internal();

  static late Flavor _flavor;

  static Flavor get flavor => _flavor;

  static bool get debugMode => kDebugMode;

  // static late SharedPreferences _preferences;

  static Future<void> init() async {
    //   _preferences = await SharedPreferences.getInstance();
    _flavor = Flavor.valueOf(const String.fromEnvironment('flavor')) ?? Flavor.PROD;
  }
}
