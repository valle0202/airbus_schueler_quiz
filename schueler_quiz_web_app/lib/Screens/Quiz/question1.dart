import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool showQuestion = true;
var answerController = TextEditingController();

Widget question1(BuildContext context) {
  if(showQuestion){
    return puzzle1(context);
  } else {
    return info1();
  }
}

Widget info1 (){
  return Text("some nice info about the A320");
}

Widget puzzle1 (BuildContext context){
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text("Für die Produktions des A320 werden 2 triebwerke, 2 Flügel, 3 Rumpfteile und 1 Leitwerk benötigt. Aktuell werden folgende Produktionszeiten benötigt:\n",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Flexible(
          flex: 5,
          child: Row(children: [
            Flexible(
              flex: 1,
              child: Text("Triebwerk: 4h\n\nFlügel: 5h \n\nRumpfteil: 4h \n\nLeitwerk: 11h",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Flexible(flex: 2, child: Container(child: Image(image: AssetImage("assets/images/a320.jpg")))),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
        ),
        Flexible(
          flex: 1,
          child: Text("Frage: Wie viele überschüssige Triebwerke stauen sich nach 11 Werktagen(24h/Tag Produktion) Tagen auf dem Werksgelände an? ",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        //SizedBox(width: 50,),
        //answer(100),
      ],
    ),
  );
}


