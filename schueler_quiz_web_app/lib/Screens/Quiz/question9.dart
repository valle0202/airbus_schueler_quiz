import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget question9(BuildContext context) {
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
                        text: 'In einem Kriegsgebiet kommt es durch ein Attentat zu vielen Verletzten, ' +
                            'welches zu einem Mangel an Bluttransfusionen führt. Es werden daher umgehend'),
                    TextSpan(text: ' 300 weitere Transfusion'),
                    TextSpan(text: 'aus dem nächstligenden Krankenhaus'),
                    TextSpan(text: ' (300km entfernt)'),
                    TextSpan(
                        text: 'angefordert. ' +
                            'Zum Transport dieser liegt dem Krankhaus leider nur ein Helikopter'),
                    TextSpan(text: '(180kmh Geschwindigkeit)'),
                    TextSpan(text: 'mit einer Tragfähigkeit von'),
                    TextSpan(text: '200 Transfusionen'),
                    TextSpan(
                        text:
                            'zur verfügung. Zudem können aber entlang der Gesamten Strecke ' +
                                'Autos'),
                    TextSpan(text: '(45kmh Geschwindigkeit)'),
                    TextSpan(
                        text:
                            'genutzt werden, welche eine uneingeschränkte Tragfähigkeit haben.'),
                  ]),
            ),
          ),
        ),
        Flexible(
            flex: 10,
            child: Container(
                constraints: BoxConstraints(maxWidth: 1000),
                child: Image.asset('assets/images/Transport.png'))),
        Flexible(
          flex: 1,
          child: Text(
            'Wenn Umlandungszeiten ignoriert werden, wie schnell (minimale Dauer) kann das Blut transportiert werden' +
                ' (Antwort in Minuten)? ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Flexible(
          flex: 1,
          child: Text(
            'Beispiel zum Eingabeformat: "1034"',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    ),
  );
}
