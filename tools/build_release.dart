import 'dart:io';
import 'package:yaml/yaml.dart';

void main(List<String> args) async {
  File pubspecFile = File("pubspec.yaml");
  YamlMap pubspecYaml = loadYaml(pubspecFile.readAsStringSync());
  if (pubspecYaml.containsKey("release-version")) {
    String releaseVersion = pubspecYaml["release-version"];
    stdout.write("$releaseVersion\n");
    File globalsFile = File("lib/tools/globals.dart");
    String globalsFileContent = globalsFile.readAsStringSync();
    globalsFile.writeAsStringSync(globalsFileContent.replaceFirst("String? releaseVersion;", 'String? releaseVersion = "$releaseVersion";'));
    var process = await Process.start(
      "flutter",
      ["build", "apk"]
    );
    await stdout.addStream(process.stdout);
    globalsFile.writeAsStringSync(globalsFileContent);
    stdout.write("done.\n");
  }
  else {
    throw Exception("release-version not found in pubspec.yaml");
  }
}