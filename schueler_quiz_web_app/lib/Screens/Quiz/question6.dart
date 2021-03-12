import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget question6(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Container(
            constraints: BoxConstraints(maxWidth: 1000),
            child: RichText(
                text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1,
              children: <TextSpan>[
                TextSpan(
                  text: 'In einer Halle sollen ',
                ),
                TextSpan(
                    text: '9 Bauplätzen ',
                    style: Theme.of(context).textTheme.headline1),
                TextSpan(text: 'der Eurofighter Produktion mit einem in '),
                TextSpan(
                    text: 'Station 1 beginnendem ',
                    style: Theme.of(context).textTheme.headline1),
                TextSpan(
                    text:
                        'Transportband in beliebiger Reihenfolge verbunden werden. Das Transportband muss mindestens einmal mittig durch jeden Bauplatz und ist beliebig lang. Die einzigen Beschränkungen sind, dass alle Transportbänder gerade verlaufen müssen und nur 3 Richtungsänderer genutzt werden können. Das bedeutet, dass das Transportband schlussendlich aus '),
                TextSpan(
                    text: '4 Geraden ',
                    style: Theme.of(context).textTheme.headline1),
                TextSpan(text: 'besteht.\n\n'),
                /*TextSpan(
                    text: 'beginnt in Station 1',
                    style: Theme.of(context).textTheme.headline1),*/
                /*TextSpan(
                    text:
                        'Gib den Verlauf der vier Bandabschnitte an indem du in chronologischer Reihenfolge die Stationen aufschreibst, durch die das Band verläuft.'),*/
              ],
            )),
          ),
        ),
        Flexible(
            flex: 10,
            child: Container(
                child: Image.asset('assets/images/Nr_X_Ver_4_Weiss.png'))),
        Flexible(
          flex: 1,
          child: Text(
            'Gib den Verlauf der vier Bandabschnitte an indem du in chronologischer Reihenfolge die Stationen aufschreibst, durch die das Band verläuft.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    ),
  );
}
