import 'package:android_package_manager/android_package_manager.dart';

import 'is_flutter_app.dart';

Future<List<ApplicationInfo>> getListOfFlutterApps() async {
  List<ApplicationInfo>? listOfAllApps = await AndroidPackageManager().getInstalledApplications();
  List<ApplicationInfo> listOfFlutterApps = [];
  if (listOfAllApps == null) {
    throw Exception("No installed apps found!");
  }
  else {
    for (ApplicationInfo appInfo in listOfAllApps) {
      if (isFlutterApp(appInfo)) {
        listOfFlutterApps += [appInfo];
      }
    }
  }
  return listOfFlutterApps;
}