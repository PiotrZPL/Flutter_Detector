import 'package:flutter/material.dart';

import '../tools/flutter_app.dart';

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
        child: Column(
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
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.flutterApp.packageName
            ),
            Text(
              "Minimum SDK version: ${widget.flutterApp.minSdk}"
            ),
            Text(
              "Target SDK version: ${widget.flutterApp.targetSdk}"
            ),
            Text(
              "Compile SDK version: ${widget.flutterApp.compileSdk}"
            ),
            Text(
              widget.flutterApp.listOfNativeLibs.toString()
            )
          ],
        )
      )
    );
  }
}