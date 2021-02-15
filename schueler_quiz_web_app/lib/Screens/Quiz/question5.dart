import 'package:flutter/cupertino.dart';

Widget question5() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('In deinem Paket befinden sich 4 kleine Zettel mit Wörtern und deren Verschlüsselungen. Erkenne die Verschlüsselungsregel und ordne den Worten ihre Verschlüsselung zu.'),
        SizedBox(height:20),
        Text('Verschlüssele nun das Wort informatik nach der gleichen verschlüsselungsregel')
      ],
    ),
  );
}