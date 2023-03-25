import 'package:android_package_manager/android_package_manager.dart';

import 'flutter_app.dart';

Future<List<FlutterApp>> getListOfFlutterAppsWithIcons({required List<ApplicationInfo> listOfFlutterApps}) async {
  List<FlutterApp> listOfFlutterAppsWithIcons = [];
  for (ApplicationInfo appInfo in listOfFlutterApps) {
    listOfFlutterAppsWithIcons += [
      FlutterApp(
        appName: appInfo.nonLocalizedLabel ?? "No name",
        packageName: appInfo.packageName ?? "No package name",
        appIcon: await appInfo.getAppIcon()
        )
    ];
  }
  return listOfFlutterAppsWithIcons;
}