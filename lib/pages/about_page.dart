import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({
    super.key,
  });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Flutter Detector",
              style: TextStyle(
                fontSize: 32
              ),
            ),
            const Text(
              "Released under the terms of the GNU GPL v3."
            ),
            const Text(
              "Copyright (c) 2023 Piotr Lange"
            ),
            TextButton(
              onPressed: () {
                showLicensePage(
                  context: context,
                  applicationName: "Flutter Detector",
                  // applicationVersion: applicationVersion,
                  // applicationIcon: applicationIcon,
                  applicationLegalese: "Released under the terms of the GNU GPL v3.\n\nCopyright (c) 2023 Piotr Lange",
                );
              }, 
              child: const Text("Show licenses")
            )
          ],
        )
      )
    );
  }
}