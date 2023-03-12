import 'package:flutter/material.dart';
import 'package:android_package_manager/android_package_manager.dart';

import '../tools/get_list_of_flutter_apps.dart';
import 'apps_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List<ApplicationInfo>> listOfFlutterApps = getListOfFlutterApps();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) {
              if (item == 0) {
                showAboutDialog(
                  context: context,
                  applicationVersion: "1.0",
                  applicationName: "Flutter Detector",
                  applicationLegalese: "Released under the terms of the GNU GPL v3.\n\nCopyright (c) 2023 Piotr Lange",
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 0,
                child: Text("About"),
              )
            ])
        ],
      ),
      body: FutureBuilder(
        future: listOfFlutterApps,
        builder: (BuildContext context, AsyncSnapshot<List<ApplicationInfo>> snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "There are",
                    style: TextStyle(
                      fontSize: 28
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    snapshot.data!.length.toString(),
                    style: const TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Flutter apps installed",
                    style: TextStyle(
                      fontSize: 28
                    ),
                  ),
                  const Text(
                    "on this device.",
                    style: TextStyle(
                      fontSize: 28
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => AppsPage(listOfFlutterApps: snapshot.data!),
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
                      icon: const Icon(
                        Icons.arrow_circle_right,
                        size: 90,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            );
          }
          return const Text("Loading...");
        }
      )
    );
  }
}