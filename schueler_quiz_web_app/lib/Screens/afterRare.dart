import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
* Infobildschirm zwischen Stufe 0 und 1 
*/
Widget easyDone(BuildContext context) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black87,
      ),
      height: 270,
      width: 480,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Klasse, du hast das erste Level von 3 geschafft. Der Timer ist jetzt pausiert bis du auf weiter klickst. \n Hier sind noch ein par Infos über Airbus und IT bei Airbus, die dir bei unserem nächsten Quiz während des richtigen Events weiterhelfen werden!',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    ),
  );
}
