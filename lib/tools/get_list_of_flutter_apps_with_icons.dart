import 'package:android_package_manager/android_package_manager.dart';

import 'flutter_app.dart';
import 'get_list_of_native_libs.dart';

Future<List<FlutterApp>> getListOfFlutterAppsWithIcons({required List<ApplicationInfo> listOfFlutterApps}) async {
  List<FlutterApp> listOfFlutterAppsWithIcons = [];
  for (ApplicationInfo appInfo in listOfFlutterApps) {
    listOfFlutterAppsWithIcons += [
      FlutterApp(
        appName: appInfo.nonLocalizedLabel ?? "No name",
        packageName: appInfo.packageName ?? "No package name",
        appIcon: await appInfo.getAppIcon(),
        minSdk: appInfo.minSdkVersion.toString(),
        targetSdk: appInfo.targetSdkVersion.toString(),
        compileSdk: appInfo.compileSdkVersion.toString(),
        listOfNativeLibs: appInfo.nativeLibraryDir != null
          ? getListOfNativeLibs(appInfo.nativeLibraryDir!)
          : []
      )
    ];
  }
  return listOfFlutterAppsWithIcons;
}