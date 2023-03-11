import 'package:flutter/material.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({
    super.key,
    required this.numberOfFlutterApps
  });

  final int numberOfFlutterApps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12
      ),
      child: Column(
        children: [
          const Text(
            "There are",
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 24
            ),
          ),
          Text(
            numberOfFlutterApps.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36
            ),
          ),
          const Text(
            "Flutter apps installed on this device",
            style: TextStyle(
              fontSize: 24
            ),
          )
        ],
      )
    );
  }

}