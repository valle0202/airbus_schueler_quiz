import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/quiz_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:schueler_quiz_web_app/constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final appName = 'Custom Themes';

    return MaterialApp(
      title: 'Airbus Schüler Quiz',
      theme: ThemeData(
        // Define the default brightness and colors.
        //brightness: Brightness.dark,
        primaryColor: primaryBlue,
        highlightColor: highlightColor1,
        accentColor: secondaryBlue,
        backgroundColor: primaryBlue,
        focusColor: primaryBlue,
        errorColor: redDanger,

        // Define the default font family.
        fontFamily: 'Roboto',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w300),
          //headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          //headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  bool loginComplete = false;
  double x = 0.0;
  double y = 0.0;
  bool defaultPosition = true;
  double buttonWidth = 420.0;
  double buttonHeight = 140.0;

  Widget loginField () {
    //var focusNode = FocusNode();
    //focusNode.requestFocus();
    return Center(
      child: Container(
        width: 400,
        height: 60,
        child: TextField(
          //focusNode: focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
            hintText: 'persönliches Passwort',
            fillColor: Colors.white60,
            filled: true,
            suffixIcon: Tooltip(message: 'Dein persönliches Passwort findest du in deinem \nPaket und auf der Anmeldeseite.',
              preferBelow: false,
              verticalOffset: 15,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: primaryBlue, borderRadius: BorderRadius.all(Radius.circular(4))),
              child: IconButton(icon: Icon(Icons.info), onPressed: () {}, mouseCursor: SystemMouseCursors.click,)
            ),
          ),
          onChanged: (String value) {
            if(value == 'Airbus') {
              setState(() {
                loginComplete = true;
              });
            }
          },
          //onSubmitted: , Fehlermeldung
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //height and width of the screen

    double percentageX = (x / size.width) * 100;
    double percentageY = (y / size.height) * 100;

    Widget startButton(){
      return Center(
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
      );
    }

    return Scaffold(
      body: MouseRegion(
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
            loginComplete? startButton() : loginField(),
            Container(child: Image.asset('assets/images/airbusblue.png'), height: 100,),
          ],
        ),
      ),
    );
  }
}