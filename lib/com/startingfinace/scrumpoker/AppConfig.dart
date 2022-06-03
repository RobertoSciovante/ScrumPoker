// ignore_for_file: prefer_expression_function_bodies, public_member_api_docs, diagnostic_describe_all_properties, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

class Flavor {
  Flavor._internal(this.name, this.color) {
    // values.add(this);
  }

  static final Flavor development = Flavor._internal('development', Colors.amber);
  static final Flavor staging = Flavor._internal('staging', Colors.blue);
  static final Flavor production = Flavor._internal('production', Colors.teal);
  static List<Flavor> values = [development, staging, production];

  static Flavor? valueOf(String name) {
    for (final element in values) {
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

  static Future<void> init(Flavor flavor) async {
    //   _preferences = await SharedPreferences.getInstance();
    // if (_flavor != null) throw "AppConfig già inizializzata";
    _flavor = flavor;
    // _flavor = Flavor.valueOf(const String.fromEnvironment('flavor')) ?? Flavor.production;
  }
}
