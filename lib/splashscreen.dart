import 'dart:io';

import 'package:bahasa_arab/auth/sign_in.dart';
import 'package:bahasa_arab/package/flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SphScreen extends StatefulWidget {
  @override
  _SphScreenState createState() => _SphScreenState();
}

class _SphScreenState extends State<SphScreen> with TickerProviderStateMixin {
  bool ActiveConnection = false;
  Color check;
  String connenct = "";

  Future<bool> CheckUserConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          ActiveConnection = true;
          check = Colors.green;
          Flushbar(
            margin: EdgeInsets.all(8),
            borderRadius: 8,
            message: "Wifi atau paket data anda sudah nyala",
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 4),
          )..show(context);
        });
      }
    } on SocketException catch (_) {
      setState(() {
        ActiveConnection = false;
        check = Colors.red;
        Flushbar(
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          message: "Nyalakan Wifi atau Paket Data Anda",
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 4),
        )..show(context);
      });
    }
  }

  @override
  void initState() {
    CheckUserConnected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        width: 100,
        height: 100,
        child: AnimatedSplashScreen(
          splash: Image.asset("assets/image/icon2.png"),
          nextScreen: LoginScreen(),
          splashIconSize: 300,
          curve: Curves.fastOutSlowIn,
          splashTransition: SplashTransition.scaleTransition,
          duration: 400,
        ),
      ),
    );
  }
}
