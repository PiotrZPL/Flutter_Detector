import 'package:flutter/material.dart';

import '../widgets/flutter_app_list_item.dart';
import '../tools/flutter_app.dart';

class AppsPage extends StatefulWidget {
  const AppsPage({
    super.key,
    required this.listOfFlutterApps
  });

  final List<FlutterApp> listOfFlutterApps;

  @override
  State<AppsPage> createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: const Text(
        //   "Flutter ",
        //   // style: TextStyle(
        //   //   color: Color.fromARGB(255, 65, 219, 134)
        //   // )
        // ),
        // iconTheme: const IconThemeData(
        //   color: Color.fromARGB(255, 65, 219, 134)
        // ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          itemCount: widget.listOfFlutterApps.length,
          itemBuilder: (context, index) {
            return FlutterAppListItem(
              flutterApp: widget.listOfFlutterApps[index]
            );
          }
        )
      )
    );
  }
}