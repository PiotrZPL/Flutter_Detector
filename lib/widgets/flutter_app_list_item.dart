import 'package:flutter/material.dart';

import '../pages/flutter_app_page.dart';
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
        : const Text("No icon"),
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => FlutterAppPage(flutterApp: flutterApp),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                    
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            )
          );
        },
      ),
    );
  }

}