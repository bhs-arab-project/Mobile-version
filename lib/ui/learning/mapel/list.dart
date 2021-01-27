part of '../../uis.dart';

class ListMateri extends StatefulWidget {
  @override
  _ListMateriState createState() => _ListMateriState();
}

class _ListMateriState extends State<ListMateri> {
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/background.png"),
                fit: BoxFit.fill)),
        child: SlidingUpPanel(
          panel: Center(
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.blue[300],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              height: MediaQuery.of(context).size.height - 367.1,
              child: Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(left: 17.0, right: 17.0),
                  child: ScrollConfiguration(
                    behavior: ListData(),
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          child: RaisedButton(
                            onPressed: () {
                              print('di Klick');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            )),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  )),
                              child: Container(
                                  child: ListTile(
                                leading:
                                    Image.asset("assets/icon/beginlearn.png"),
                                title: Text("pendahuluan"),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/belajar');
                                },
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          collapsed: Container(
            decoration:
                BoxDecoration(color: Colors.blueGrey, borderRadius: radius),
            child: Center(
              child: Text(
                "Daftar Materi",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: Center(
              child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                        height: 40.0,
                        margin: EdgeInsets.only(top: 7.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        )),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.height / 8.5),
                          child: Text("Materi",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 23.0,
                                  fontFamily: "Mont"))),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 55,),
                child: Card(
                  elevation: 7.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 45.0,
                              backgroundImage:
                                  AssetImage("assets/image/man.png"),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 90),
                            Text("Abdul Malik",
                                style: TextStyle(
                                    fontFamily: "Mont",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Nahwu",
                                style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 40),
                            Text("Nahwu adalah bla bla bla ",
                                style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          borderRadius: radius,
        ),
      ),
    );
  }
}

class ListData extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

// return Scaffold(
//           body: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/background/background.png"),
//                 fit: BoxFit.fill)),
//         child: Column(
//           children: [
//             Container(
//               child: Row(
//                 children: [
//                   Container(
//                     height: 45.0,
//                     margin: EdgeInsets.only(top: 7.0),
//                     child: FloatingActionButton(
//                       onPressed: (){
//                         Navigator.pop(context);
//                       },
//                       child: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 30.0,),
//                     )
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(left: MediaQuery.of(context).size.height / 8),
//                     child: Text("Materi", style: TextStyle(fontStyle: FontStyle.normal, fontSize: 25.0, fontFamily: "Mont")))
//                 ],
//               ),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height / 4,
//               margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15, left: 13.0, right: 13.0),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0)),
//                 child: Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(15.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircleAvatar(
//                             radius: 45.0,
//                             backgroundImage: AssetImage("assets/image/man.png"),
//                           ),
//                           SizedBox(
//                               height: MediaQuery.of(context).size.height / 90),
//                           Text("Abdul Malik",
//                               style: TextStyle(
//                                   fontFamily: "Mont",
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700))
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(15.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Nahwu",
//                               style: TextStyle(
//                                   fontFamily: 'Avenir',
//                                   fontWeight: FontWeight.w700)),
//                           SizedBox(
//                               height: MediaQuery.of(context).size.height / 40),
//                           Text("Nahwu adalah bla bla bla ",
//                               style: TextStyle(
//                                   fontFamily: 'Avenir',
//                                   fontWeight: FontWeight.w600))
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 15,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   // color: Colors.blue[300],
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40.0),
//                       topRight: Radius.circular(40.0))),
//               height: MediaQuery.of(context).size.height - 367.1,
//               child: Container(
//                   alignment: Alignment.topCenter,
//                   margin: EdgeInsets.only(top: 30.0, left: 17.0, right: 17.0),
//                   child: ScrollConfiguration(
//                     behavior: ListData(),
//                     child: ListView(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(bottom: 10.0),
//                           child: RaisedButton(
//                             onPressed: () {},
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(15),
//                               topRight: Radius.circular(15),
//                               bottomLeft: Radius.circular(15),
//                               bottomRight: Radius.circular(15),
//                             )),
//                             padding: EdgeInsets.all(0.0),
//                             child: Ink(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(15),
//                                     topRight: Radius.circular(15),
//                                     bottomLeft: Radius.circular(15),
//                                     bottomRight: Radius.circular(15),
//                                   )),
//                               child: Container(
//                                   child: ListTile(
//                                 leading:
//                                     Image.asset("assets/icon/beginlearn.png"),
//                                 title: Text("pendahuluan"),
//                                 trailing: Icon(Icons.keyboard_arrow_right),
//                                 onLongPress: () {
//                                   Navigator.pushNamed(context, '/belajar');
//                                 },
//                               )),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
