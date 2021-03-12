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
                      text:
                          'In einem Kriegsgebiet kommt es durch ein Attentat zu vielen Verletzten, weshalb ein Mangel an Bluttransfusionen entsteht. Es werden daher umgehend '),
                  TextSpan(
                      text: '300 weitere Transfusionen ',
                      style: Theme.of(context).textTheme.headline1),
                  TextSpan(text: 'aus dem nächstligenden Krankenhaus '),
                  TextSpan(
                      text: '(300km entfernt) ',
                      style: Theme.of(context).textTheme.headline1),
                  TextSpan(
                      text:
                          'angefordert. Zum Transport dieser liegt dem Krankhaus leider nur ein '),
                  TextSpan(
                      text:
                          'Helikopter (Durchnittsgeschwindigkeit 180km/h) mit einer Tragfähigkeit von 200 Transfusionen ',
                      style: Theme.of(context).textTheme.headline1),
                  TextSpan(
                      text:
                          'zur Verfügung. Zudem können aber entlang der gesamten Strecke '),
                  TextSpan(
                      text: 'Autos (Durchnittsgeschwindigkeit 45km/h) ',
                      style: Theme.of(context).textTheme.headline1),
                  TextSpan(
                      text:
                          'genutzt werden, welche eine uneingeschränkte Tragfähigkeit haben.'),
                ],
              ),
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
