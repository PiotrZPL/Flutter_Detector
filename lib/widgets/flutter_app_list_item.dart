import 'package:flutter/material.dart';
import 'package:android_package_manager/android_package_manager.dart';

class FlutterAppListItem extends StatelessWidget {
  const FlutterAppListItem({
    super.key,
    required this.flutterApp
  });

  final ApplicationInfo flutterApp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: 
      ListTile(
        title: Text(flutterApp.nonLocalizedLabel ?? "No name"),
        subtitle: Text(flutterApp.packageName ?? "No package name"),
        leading: FutureBuilder(
          future: flutterApp.getAppIcon(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Image.memory(snapshot.data!);
            }
            return const Text("Loading...");
          },
        ),
      ),
    );
  }

}