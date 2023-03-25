import 'package:flutter/material.dart';
import 'package:android_package_manager/android_package_manager.dart';
import 'package:flutter_detector/tools/flutter_app.dart';

import '../tools/get_list_of_flutter_apps.dart';
import '../tools/get_list_of_flutter_apps_with_icons.dart';
import 'apps_page.dart';
import 'about_page.dart';

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const AboutPage()
                  )
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 0,
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                ),
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
                  FutureBuilder(
                    future: getListOfFlutterAppsWithIcons(listOfFlutterApps: snapshot.data!),
                    builder: (BuildContext context, AsyncSnapshot<List<FlutterApp>> snapshot2) {
                      return SizedBox(
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => AppsPage(listOfFlutterApps: snapshot2.data!),
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
                      );
                    }
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            );
          }
          return const Center(
            child: SizedBox(
              height: 50.0,
              width: 50.0,
              child: CircularProgressIndicator(
                strokeWidth: 7.0,
              ),
            ),
          );
        }
      )
    );
  }
}