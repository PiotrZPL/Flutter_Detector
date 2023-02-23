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
        title: Text(flutterApp.appLabel),
        subtitle: Text(flutterApp.appName),
      ),
    );
  }

}