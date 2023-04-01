import 'package:flutter/material.dart';

class PackageInfoTable extends StatelessWidget {
  const PackageInfoTable({
    super.key,
    // required this.numberOfFlutterApps
    required this.minSdk,
    required this.compileSdk,
    required this.targetSdk,
    required this.listOfNativeLibs
  });

  // final int numberOfFlutterApps;
  final String minSdk;
  final String compileSdk;
  final String targetSdk;
  final List<String> listOfNativeLibs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 10
      ),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: const TableBorder(
          horizontalInside: BorderSide(
            width: 0.3,
            color: Colors.white
          )
        ),
        children: [
          buildInfoRow(
            infoName: "Minimum SDK",
            infoValue: minSdk
          ),
          buildInfoRow(
            infoName: "Compile SDK",
            infoValue: compileSdk
          ),
          buildInfoRow(
            infoName: "Target SDK",
            infoValue: targetSdk
          ),
          TableRow(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 2
                ),
                child: Text("Native libraries"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2
                ),
                child: buildLibColumn(),
              )
            ]
          )
        ],
      )
    );
  }

  Column buildLibColumn() {
    List<Text> listOfLibsWidgets = [];

    for (String library in listOfNativeLibs) {
      listOfLibsWidgets += [
        Text(
          library,
          style: TextStyle(
            fontWeight: library == "libflutter.so" ? FontWeight.bold : FontWeight.normal
          ),
        )
      ];
    }

    return Column(
      children: listOfLibsWidgets,
    );
  }

  TableRow buildInfoRow({
    required String infoName,
    required String infoValue
  }) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2
          ),
          child: Text(infoName)
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2
          ),
          child: Text(
            infoValue,
            textAlign: TextAlign.center,
          ),
        )
      ]
    );
  }
}