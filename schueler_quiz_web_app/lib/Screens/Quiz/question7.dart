/*import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

Widget question7(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text('Bringe den folgenden Code in die richtige Reihenfolge, damit eine Liste in aufsteigender Reihenfolge sortiert wird',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Flexible(
          flex: 10, 
          child: ReorderableListView(
            children: [
              ListTile(key: ValueKey(1), title: Text('Es sei i eine Variable, die ganze Zahlen Speichert', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor1,),
              ListTile(key: ValueKey(2), title: Text('solange i kleiner als die Länge der Liste ist, wird i um 1 erhöht und folgendes ausgeführt: {', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor2,),
              ListTile(key: ValueKey(3), title: Text('}', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor2,),
              ListTile(key: ValueKey(4), title: Text('Es sei min eine Variable, in die der aktuelle Wert von i gespeichert wird', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor3,),
              ListTile(key: ValueKey(5), title: Text('Es sei j eine Variable, in die der aktuelle Wert von i+1 gespeichert wird', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor4,),
              ListTile(key: ValueKey(6), title: Text('solange j kleiner als die Länge der Liste ist, wird j um 1 erhöht und folgendes ausgeführt: {', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor5,),
              ListTile(key: ValueKey(7), title: Text('}', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor5,),
              ListTile(key: ValueKey(8), title: Text('Falls der Eintrag der Liste an der Stelle j kleiner ist als der Eintrag an der Stelle min, dann: {', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor6,),
              ListTile(key: ValueKey(9), title: Text('}', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor6,),
              ListTile(key: ValueKey(10), title: Text('weise der Variabel min den aktuellen Wert von j zu', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor7,),
              ListTile(key: ValueKey(11), title: Text('Falls der Wert von min nicht der gleiche ist, wie der von i: {', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor7,),
              ListTile(key: ValueKey(12), title: Text('}', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor7,),
              ListTile(key: ValueKey(13), title: Text('tausche das Listenelement an der Stelle i mit dem an der Stelle min', style: Theme.of(context).textTheme.bodyText1), tileColor: highlightColor7,),
            ],
            onReorder: reorderData,
          ),
        ),
      ],
    ),
  );
}

  void reorderData(int oldindex, int newindex){
    setState(() {
      if(newindex>oldindex){
        newindex-=1;
      }
      final items =widget.item.removeAt(oldindex);
      widget.item.insert(newindex, items);
    });
  }*/