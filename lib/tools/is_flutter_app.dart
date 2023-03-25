import 'package:android_package_manager/android_package_manager.dart';

import 'get_list_of_native_libs.dart';

bool isFlutterApp(ApplicationInfo appInfo) {
  if (appInfo.nativeLibraryDir != null) {
    if (appInfo.nativeLibraryDir!.isNotEmpty) {
      List<String> listOfNativeLibs = getListOfNativeLibs(appInfo.nativeLibraryDir!);
      if (listOfNativeLibs.contains("libflutter.so")) {
        return true;
      }
    }
  }
  return false;
}