import 'dart:io';

List<String> getListOfNativeLibs(String nativeLibsDir) {
  List<String> listToReturn = [];
  Directory nativeLibraryDir = Directory(nativeLibsDir);
  if (nativeLibraryDir.existsSync()) {
    List<FileSystemEntity> listOfNativeLibs = nativeLibraryDir.listSync();
    for (FileSystemEntity library in listOfNativeLibs) {
      String libraryName = library.path.split("/").last;
      listToReturn += [libraryName];
    }
    return listToReturn;
  }
  return [];
}