import 'package:flutter/material.dart';
import 'package:schueler_quiz_web_app/Screens/home_screen.dart';
import 'package:schueler_quiz_web_app/constants.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
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
          bodyText2: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
          headline1: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
          headline2: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300),
          //headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          //headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

