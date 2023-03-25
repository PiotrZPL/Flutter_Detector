import 'package:flutter/material.dart';

import '../tools/flutter_app.dart';

class FlutterAppListItem extends StatelessWidget {
  const FlutterAppListItem({
    super.key,
    required this.flutterApp
  });

  final FlutterApp flutterApp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: 
      ListTile(
        title: Text(flutterApp.appName),
        subtitle: Text(flutterApp.packageName),
        leading: flutterApp.appIcon != null
        ? Image.memory(flutterApp.appIcon!)
        : const Text("No icon")

        // leading: FutureBuilder(
        //   future: flutterApp.getAppIcon(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Image.memory(snapshot.data!);
        //     }
        //     return const Text("Loading...");
        //   },
        // ),
      ),
    );
  }

}