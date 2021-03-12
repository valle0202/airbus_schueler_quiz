import 'package:flutter/material.dart';
import 'package:schueler_quiz_web_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ende extends StatefulWidget {

  final double punktzahl;
  final String personalPassword;

  Ende(this.punktzahl, this.personalPassword);

  @override
  _EndeState createState() => _EndeState();
}

class _EndeState extends State<Ende> {

  List<Color> colorList = [
    highlightColor2F,
    highlightColor3F,
    highlightColor4F,
    highlightColor5F,
    highlightColor6F,
    highlightColor7F,
    highlightColor1F,
    /*Colors.black,
    mainBlue,
    primaryBlue,
    secondaryBlue,*/
  ];
  int index = 0;
  Color bottomColor = highlightColor2F;
  Color topColor = highlightColor3F;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {bottomColor = highlightColor3F;}));
    FirebaseFirestore.instance.collection('punkte').add({widget.personalPassword : widget.punktzahl});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          width: size.width,
          onEnd: () {
            setState(() {
              index = index + 1;
              bottomColor = colorList[index % colorList.length];
              topColor = colorList[(index + 1) % colorList.length];
            });
          },
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [bottomColor, topColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          ),
          child: Column(
            children: [
              Text(
                'Die Zeit ist abgelaufen vielen Dank für die Teilname! Du hast: ' + widget.punktzahl.toString() + ' von 100 Punkten erreicht!', 
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          )
        )
      ),
    );
  }
}