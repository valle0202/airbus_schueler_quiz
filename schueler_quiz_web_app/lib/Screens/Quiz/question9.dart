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
            child: Text(
              'In einem Kriegsgebiet kommt es durch ein Attentat zu vielen Verletzten, ' +
                  'welches zu einem Mangel an Bluttransfusionen führt. Es werden daher umgehend' +
                  ' 300 weitere Transfusion aus dem nächstligenden Krankenhaus (300km entfernt) angefordert. ' +
                  'Zum Transport dieser liegt dem Krankhaus leider nur ein Helikopter (Durchnittsgeschwindigkeit 180kmh) ' +
                  'mit einer Tragfähigkeit von 200 Transfusionen zur Verfügung. Zudem können aber entlang der gesamten Strecke ' +
                  'Autos (Durchnittsgeschwindigkeit 45kmh) genutzt werden, welche eine uneingeschränkte Tragfähigkeit haben.',
              style: Theme.of(context).textTheme.bodyText1,
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
      ],
    ),
  );
}
