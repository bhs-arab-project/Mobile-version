// import 'package:flutter/material.dart';

// class TutorialOverlay extends ModalRoute<void> {
//   @override
//   Duration get transitionDuration => Duration(milliseconds: 500);

//   @override
//   bool get opaque => false;

//   @override
//   bool get barrierDismissible => false;

//   @override
//   Color get barrierColor => Colors.black.withOpacity(0.5);

//   @override
//   String get barrierLabel => null;

//   @override
//   bool get maintainState => true;

//   @override
//   Widget buildPage(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//   ) {
//     // This makes sure that text and other content follows the material style
//     return Material(
//       type: MaterialType.transparency,
//       // make sure that the overlay content is not cut off
//       child: SafeArea(
//         child: _buildOverlayContent(context),
//       ),
//     );
//   }

//   Widget _buildOverlayContent(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text(
//             'This is a nice overlay',
//             style: TextStyle(color: Colors.white, fontSize: 30.0),
//           ),
//           RaisedButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Dismiss'),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     // You can add your own animations for the overlay content
//     return FadeTransition(
//       opacity: animation,
//       child: ScaleTransition(
//         scale: animation,
//         child: child,
//       ),
//     );
//   }
// }

// // Example application:
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Playground',
//       home: TestPage(),
//     );
//   }
// }

// class TestPage extends StatelessWidget {
//   void _showOverlay(BuildContext context) {
//     Navigator.of(context).push(TutorialOverlay());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Test')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Center(
//           child: RaisedButton(
//             onPressed: () => _showOverlay(context),
//             child: Text('Show Overlay'),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
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
          connenct = "Wifi atau paket data anda sudah nyala";
        });
      }
    } on SocketException catch (_) {
      setState(() {
        ActiveConnection = false;
        check = Colors.red;
        connenct = "Nyalakan Wifi atau Paket Data Anda";
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cek Internet"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Active Connection? $ActiveConnection "),
                  Icon(
                    Icons.wifi,
                    color: check,
                  )
                ],
              ),
              Divider(),
              Text(
                "$connenct",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                  child: Text("Cek"),
                  onPressed: () {
                    CheckUserConnected();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
