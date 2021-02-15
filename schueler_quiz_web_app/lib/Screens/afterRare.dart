import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class easyDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Klasse, du hast das erste Level von 3 geschafft. Der Timer ist jetzt pausiert bis du auf weiter klickst. \n Hier sind noch ein par Infos über Airbus und IT bei Airbus, die dir bei unserem nächsten Quiz während des richtigen Events weiterhelfen werden!'),
          TextButton(child: Text('Weiter'), onPressed: () {Navigator.pop(context);},),
        ],
      ),
    );
  }
}