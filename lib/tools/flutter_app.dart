import 'package:flutter/foundation.dart';

class FlutterApp {
  FlutterApp({
    required this.appName,
    required this.packageName,
    this.appIcon
  });

  String appName;
  String packageName;
  Uint8List? appIcon;
}