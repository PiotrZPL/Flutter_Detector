import 'package:flutter/foundation.dart';

class FlutterApp {
  FlutterApp({
    required this.appName,
    required this.packageName,
    this.appIcon,

    required this.minSdk,
    required this.targetSdk,
    required this.compileSdk,

    required this.listOfNativeLibs
  });

  String appName;
  String packageName;
  Uint8List? appIcon;

  String minSdk;
  String targetSdk;
  String compileSdk;

  List<String> listOfNativeLibs;
}