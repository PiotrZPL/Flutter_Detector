import 'package:android_package_manager/android_package_manager.dart';

import 'flutter_app.dart';
import 'is_flutter_app.dart';

Future<List<FlutterApp>> getListOfFlutterApps() async {
  List<ApplicationInfo>? listOfAllApps = await AndroidPackageManager().getInstalledApplications();
  List<FlutterApp> listOfFlutterApps = [];
  if (listOfAllApps == null) {
    throw Exception("No installed apps found!");
  }
  else {
    for (ApplicationInfo appInfo in listOfAllApps) {
      if (isFlutterApp(appInfo)) {
        listOfFlutterApps += [FlutterApp(
          appName: appInfo.packageName ?? "No package name",
          appLabel: appInfo.nonLocalizedLabel ?? "No name")
        ];
      }
    }
  }
  return listOfFlutterApps;
}