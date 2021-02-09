

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schueler_quiz_web_app/constants.dart';

Widget question1() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text("Für die Produktions des A320 werden 2 triebwerke, 2 Flügel, 3 Rumpfteile und 1 Leitwerk benötigt. \nAktuell werden folgende Produktionszeiten benötigt:\n1 Triebwerk: 4h\n1 Flügel: 5h \n1 Rumpfteil: 4h \n1 Leitwerk: 11h"),
          Container(
            width: 100,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Antwort',
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: secondaryBlue, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: primaryBlue, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    )
  );
}