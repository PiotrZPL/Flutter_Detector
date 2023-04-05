import 'package:flutter/material.dart';
import 'package:app_actions/app_actions.dart';

import '../tools/flutter_app.dart';
import '../widgets/package_info_table.dart';

class FlutterAppPage extends StatefulWidget {
  const FlutterAppPage({
    super.key,
    required this.flutterApp
  });

  final FlutterApp flutterApp;

  @override
  State<FlutterAppPage> createState() => _FlutterAppPageState();
}

class _FlutterAppPageState extends State<FlutterAppPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: ListView(
          children: [
            widget.flutterApp.appIcon != null
            ? Image.memory(
              widget.flutterApp.appIcon!,
              width: 100,
              height: 100,
            )
            : const Text("No icon"),
            Text(
              widget.flutterApp.appName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.flutterApp.packageName,
              textAlign: TextAlign.center,
            ),
            PackageInfoTable(
              minSdk: widget.flutterApp.minSdk,
              targetSdk: widget.flutterApp.targetSdk,
              compileSdk: widget.flutterApp.compileSdk,
              listOfNativeLibs: widget.flutterApp.listOfNativeLibs,
            ),
            ElevatedButton(
              onPressed: () {
                AppActions().openApp(appName: widget.flutterApp.packageName);
              },
              child: const Text("Open app")
            ),
            ElevatedButton(
              onPressed: () {
                AppActions().openAppSettings(appName: widget.flutterApp.packageName);
              },
              child: const Text("Open settings")
            )
          ],
        )
      )
    );
  }
}