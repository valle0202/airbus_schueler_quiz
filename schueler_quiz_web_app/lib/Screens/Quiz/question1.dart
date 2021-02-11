

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schueler_quiz_web_app/constants.dart';

bool showQuestion = true;

Widget question1() {
  if(showQuestion){
    return puzzle1();
  } else {
    return info1();
  }
}

Widget info1 (){
  return Text("some nice info about the A320");
}

Widget puzzle1 (){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Für die Produktions des A320 werden 2 triebwerke, 2 Flügel, 3 Rumpfteile und 1 Leitwerk benötigt. \nAktuell werden folgende Produktionszeiten benötigt:\n",
          style: TextStyle(fontSize: 20),
        ),
        Row(children: [
          Text("Triebwerk: 4h\nFlügel: 5h \nRumpfteil: 4h \nLeitwerk: 11h",
            style: TextStyle(fontSize: 28, height: 2.5),
          ),
          Container(child: Image(image: AssetImage("assets/images/a320.jpg"), height: 280,)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        Text("Frage: Wie viele überschüssige Triebwerke stauen sich nach 11 Werktagen(24h/Tag Produktion) Tagen auf dem Werksgelände an? ",
          style: TextStyle(fontSize: 20, color: Colors.grey[800]), 
        ),
        //SizedBox(width: 50,),
        //answer(100),
      ],
    ),
  );
}


Widget answer (double width) {
  return AnimatedContainer(
    curve: Curves.easeOutQuad,
    duration: Duration(milliseconds: 900),
    width: width,
    child: Visibility(
      visible: width == 0? false:true,
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
  );
}