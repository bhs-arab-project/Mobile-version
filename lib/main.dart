import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bahasa_arab/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Splash Screen",
    home: SphScreen(),
  ));
}

class SphScreen extends StatefulWidget {
  @override
  _SphScreenState createState() => _SphScreenState();
}

class _SphScreenState extends State<SphScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset("assets/image/launcher.png"),
        nextScreen: MyApp(),
        splashIconSize: 300,
        curve: Curves.fastOutSlowIn,
        splashTransition: SplashTransition.scaleTransition,
        duration: 400,
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
 
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//            appBar: AppBar(
//              title: Text('Change Text Dynamically on Button Click')
//              ),
//             body: Center(
//               child: UpdateText()
//               )
//             )
//           );
//   }
// }
 
// class UpdateText extends StatefulWidget {
 
//   UpdateTextState createState() => UpdateTextState();
 
// }
 
// class UpdateTextState extends State {
 
//   String textHolder = 'Old Sample Text...!!!';
 
//   changeText() {
 
//     setState(() {
//      textHolder = 'New Sample Text...';
//     });
    
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Column(
//         children: <Widget>[
//         Container(
//           padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//           child: Text('$textHolder', 
//             style: TextStyle(fontSize: 21))),
 
//         RaisedButton(
//           onPressed: () => changeText(),
//           child: Text('Click Here To Change Text Widget Text Dynamically'),
//           textColor: Colors.white,
//           color: Colors.green,
//           padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//         ),
        
//       ]))
//     );
//   }
// }