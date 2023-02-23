import 'package:flutter/material.dart';

import '../tools/flutter_app.dart';
import '../widgets/flutter_app_list_item.dart';

List<Widget> buildListOfFlutterAppListItems({
  required List<FlutterApp> listOfFlutterApps
}) {
  List<Widget> listOfFlutterAppsWidgets = [];
  for (FlutterApp flutterApp in listOfFlutterApps) {
    listOfFlutterAppsWidgets += [
      FlutterAppListItem(flutterApp: flutterApp)
    ];
  }
  return listOfFlutterAppsWidgets;
}