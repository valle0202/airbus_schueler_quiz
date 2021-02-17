import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool showQuestion = true;
var answerController = TextEditingController();

Widget question1(BuildContext context) {
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
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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


