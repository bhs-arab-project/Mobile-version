part of '../../uis.dart';

class ListGuru extends StatefulWidget {
  @override
  _ListGuruState createState() => _ListGuruState();
}

class _ListGuruState extends State<ListGuru> {
  TextEditingController filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                image: DecorationImage(
                    image: AssetImage("assets/image/icon.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 25.0,
                left: 10.0,
                right: MediaQuery.of(context).size.height / 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Daftar Guru",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Avenir'),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.amber.withOpacity(0.6)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                          left: 20.0
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/image/man.png'),
                              radius: 45.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0, left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shorof",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Avenir'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Ust. Reihan",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Avenir'),
                                  ),
                                  RaisedButton(
                                    color: Colors.amber.withOpacity(0.6),
                                    child: Text(
                                      "Daftar Bab",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ListMateri()));
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 10),
                  // Card(
                  //   child: InkWell(
                  //     onTap: () {},
                  //     child: Container(
                  //       margin: EdgeInsets.only(
                  //         top: 10.0,
                  //         bottom: 10.0,
                  //         left: 20.0
                  //       ),
                  //       child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           CircleAvatar(
                  //             backgroundImage:
                  //                 AssetImage('assets/image/man.png'),
                  //             radius: 45.0,
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(top: 10.0, left: 20.0),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   "Shorof",
                  //                   style: TextStyle(
                  //                       fontSize: 20,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontFamily: 'Avenir'),
                  //                 ),
                  //                 SizedBox(
                  //                   height: 5,
                  //                 ),
                  //                 Text(
                  //                   "Ust. Reihan",
                  //                   style: TextStyle(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontFamily: 'Avenir'),
                  //                 ),
                  //                 RaisedButton(
                  //                   color: Colors.amber.withOpacity(0.6),
                  //                   child: Text(
                  //                     "Daftar Bab",
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   onPressed: () {},
                  //                 ),
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  // Card(
                  //   child: InkWell(
                  //     onTap: () {},
                  //     child: Container(
                  //       margin: EdgeInsets.only(
                  //         top: 10.0,
                  //         bottom: 10.0,
                  //         left: 20.0
                  //       ),
                  //       child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           CircleAvatar(
                  //             backgroundImage:
                  //                 AssetImage('assets/image/man.png'),
                  //             radius: 45.0,
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(top: 10.0, left: 20.0),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   "Shorof",
                  //                   style: TextStyle(
                  //                       fontSize: 20,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontFamily: 'Avenir'),
                  //                 ),
                  //                 SizedBox(
                  //                   height: 5,
                  //                 ),
                  //                 Text(
                  //                   "Ust. Reihan",
                  //                   style: TextStyle(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontFamily: 'Avenir'),
                  //                 ),
                  //                 RaisedButton(
                  //                   color: Colors.amber.withOpacity(0.6),
                  //                   child: Text(
                  //                     "Daftar Bab",
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   onPressed: () {},
                  //                 ),
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              )),
        ],
      ),
    ));
  }
}
