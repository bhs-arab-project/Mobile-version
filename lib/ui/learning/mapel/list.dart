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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            color: Colors.white,
            onPressed: () {
              print('Balik Ke Daftar');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen()));
            }),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Materi", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/background.png"),
                fit: BoxFit.fill)),
        child: SlidingUpPanel(
          panel: Center(
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
                            print('Materi');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Pembelajaran()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          )),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                )),
                            child: Container(
                                child: ListTile(
                              leading: Image.asset("assets/icon/beginlearn.png",
                                  width:
                                      MediaQuery.of(context).size.width / 13),
                              title: Text("pendahuluan",
                                  style: TextStyle(fontFamily: 'Mont')),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              // onTap: () {
                              // Navigator.pushNamed(context, '/belajar');
                              // },
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          collapsed: Container(
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: radius),
            child: Column(
              children: [
                Icon(
                  Icons.arrow_drop_up,
                  size: 40,
                ),
                Center(
                  child: Text(
                    "Daftar Materi",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Container(
                  child:
                      Text("dsdasdasdasdasdadasdasdsddasdasasdasdasdasdasd")),
            ],
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height / 4,
          //   margin: EdgeInsets.only(top: 10, left: 5.0, right: 5.0),
          //   padding: EdgeInsets.all(10.0),
          //   child: Row(
          //       children: [
          //         Container(
          //           padding: EdgeInsets.all(15.0),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               CircleAvatar(
          //                 radius: 45.0,
          //                 backgroundImage: AssetImage("assets/image/man.png"),
          //               ),
          //               SizedBox(
          //                   height: MediaQuery.of(context).size.height / 90),
          //               Text("Abdul Malik",
          //                   style: TextStyle(
          //                       fontFamily: "Mont",
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700))
          //             ],
          //           ),
          //         ),
          //         Container(
          //           padding: EdgeInsets.all(15.0),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text("Nahwu",
          //                   style: TextStyle(
          //                       fontFamily: 'Avenir',
          //                       fontWeight: FontWeight.w700)),
          //               SizedBox(
          //                   height: MediaQuery.of(context).size.height / 40),
          //               Text(
          //                   "Nahwu adalah bla bla bla ddsadsadasdasdad as dasfasfasdgksdgndzfghsd hgjdbghsd s",
          //                   style: TextStyle(
          //                       fontFamily: 'Avenir',
          //                       fontWeight: FontWeight.w600))
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          // ),
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
