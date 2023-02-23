import 'dart:io';

import 'package:android_package_manager/android_package_manager.dart';

bool isFlutterApp(ApplicationInfo appInfo) {
  if (appInfo.nativeLibraryDir != null) {
    if (appInfo.nativeLibraryDir!.isNotEmpty) {
      String dirString = appInfo.nativeLibraryDir!;
      Directory nativeLibraryDir = Directory(dirString);
      if (nativeLibraryDir.existsSync()) {
        List<FileSystemEntity> listOfNativeLibs = nativeLibraryDir.listSync();
        for (FileSystemEntity library in listOfNativeLibs) {
          String libraryName = library.path.split("/").last;
          if (libraryName == "libflutter.so") {
            return true;
          }
        }
      }
    }
  }
  return false;
}