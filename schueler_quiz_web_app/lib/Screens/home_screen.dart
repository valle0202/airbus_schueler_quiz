import 'package:flutter/material.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/quiz_screen.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double x = 0.0;
  double y = 0.0;
  bool defaultPosition = true;
  double buttonWidth = 420.0;
  double buttonHeight = 140.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //height and width of the screen

    double percentageX = (x / size.width) * 100;
    double percentageY = (y / size.height) * 100;

    return MouseRegion(
      onEnter: (_) {setState(() {
        defaultPosition = false;
      });},
      onExit: (_) {setState(() {
        x = size.width / 2;
        y = size.height / 2;
        defaultPosition = true;
      });},
      onHover: (details) {
        if (mounted) setState(() => defaultPosition = false);
        if (details.localPosition.dx > 0 && details.localPosition.dy > 0){
          if (details.localPosition.dx < size.width && details.localPosition.dy < size.height){
            x = details.localPosition.dx;
            y = details.localPosition.dy;
          }
        }
      },
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/zeroEAll.jpg"),
                fit: BoxFit.cover)
                ),
              ),
            Center(
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(defaultPosition ? 0 : (0.3 * (percentageY / 50) -0.3))
                    ..rotateY(defaultPosition ? 0 : (-0.3 * (percentageX / 50) + 0.3)),
                  alignment: FractionalOffset.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                      elevation: 5.0,
                      fixedSize: Size(buttonWidth, buttonHeight),
                    ),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..translate(defaultPosition ? 0.0 : (30 * (percentageX / 50) + -30),
                                    defaultPosition ? 0.0 : (22 * (percentageY / 50) + -22), 0.0),
                      alignment: FractionalOffset.center,
                      child: Text(
                        'START THE \n      CHALLENGE!', 
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 45,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return QuizScreen();}));
                    },
                  ),
                ),
          ),
        ],
      ),
    );
  }
}