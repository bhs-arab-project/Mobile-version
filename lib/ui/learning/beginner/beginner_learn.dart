part of '../../uis.dart';

class BeginLearn extends StatefulWidget {
  @override
  _BeginLearnState createState() => _BeginLearnState();
}

class _BeginLearnState extends State<BeginLearn> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
        backgroundColor: HexColor("#089467"),
        body: ScrollConfiguration(
          behavior: BeginScroll(),
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                children: <Widget>[TitleBegin(), IntroBegin(), TableBegin()],
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 20, bottom: 40),
                  child: FloatingActionButton(
                    backgroundColor: HexColor("#089467"),
                    foregroundColor: Colors.white,
                    splashColor: Colors.white38,
                    tooltip: "Back | To Learning Page",
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Icon(Icons.arrow_back),
                  ))
            ],
          ),
        ));
  }
}

class TitleBegin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 45, vertical: 55),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Image.asset(
                "assets/icon/learningarabicgreen.png",
                height: 270,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Beginner",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
                alignment: Alignment.center,
                child: Text("Learning Session",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 19.2,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ))),
            SizedBox(height: 50),
            FlatButton(
                onPressed: () {
                  MaterialPageRoute(builder: (context) => IntroBegin());
                },
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: BorderSide(color: HexColor("#089467"), width: 1.5)),
                child: Text("GET STARTED",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Avenir")))
          ],
        ));
  }
}

class IntroBegin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 55),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: HexColor("#089467"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text("Pengenalan",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20, bottom: 20),
                            child: Text("Learning | Beginner",
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 13,
                                  color: const Color(0x7cdbf1ff),
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/image/globalisasi.png",
                              height: 70),
                          Image.asset("assets/icon/beginlearn.png",
                              height: 120),
                        ],
                      ),
                      Text(
                          "        Di era globalisasi seperti saat ini, belajar bahasa asing sudah seolah jadi suatu keharusan. Belajar bahasa asing akan mendatangkan banyak keuntungan. Kita jadi bisa berkomunikasi secara langsung dengan orang-orang di berbagai belahan dunia. Salah satu bahasa asing yang penting dan menarik untuk dipelajari ialah bahasa Arab.",
                          style: TextStyle(fontSize: 13, color: Colors.black),
                          textAlign: TextAlign.justify),
                      SizedBox(height: 15),
                      Text(
                          "        Karena penting dipelajari, saat ini bahasa Arab sudah mulai diajarkan di sekolah-sekolah. Bahasa asing memang penting untuk dikuasai, sebab mempunyai banyak penutur, khususnya di negara Timur Tengah. Salah satu cara belajar bahasa asing yang menyenangkan, bisa dengan menghapalkan kata-kata di keseharian.",
                          style: TextStyle(fontSize: 13, color: Colors.black),
                          textAlign: TextAlign.justify),
                      SizedBox(height: 15),
                      Text(
                          "Nah, sebagai bekal kalian belajar, berikut beberapa kosa kata benda dan kata sifat dalam bahasa Arab yang perlu kalian hapalkan.",
                          style: TextStyle(fontSize: 13, color: Colors.black),
                          textAlign: TextAlign.justify)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text("SWIPE",
                                style: TextStyle(
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward,
                              size: 21,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 20),
          child: Image.asset(
            "assets/icon/learningarabiclogo.png",
            height: 150,
          ),
        ),
      ],
    );
  }
}

class TableBegin extends StatefulWidget {
  @override
  _TableBeginState createState() => _TableBeginState();
}

class _TableBeginState extends State<TableBegin> {
  List kamusArab;

  void kosaKata() {
    getKosaKataBegin().then((value) {
      setState(() {
        kamusArab = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    kosaKata();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 55),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: HexColor("#089467"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text("Kosa Kata Benda",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20, bottom: 20),
                            child: Text("Learning | Beginner",
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 13,
                                  color: const Color(0x7cdbf1ff),
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    )),
                SizedBox(height: 20),
                Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Arab", style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w500)),
                                  Text("Arab Latin", style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "Avenir",
                                      fontWeight: FontWeight.w500)),
                                  Text("Indonesia", style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "Avenir",
                                      fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Divider(),
                kamusArab == null
                    ? Center(
                        child: SpinKitThreeBounce(color: Colors.green[600]))
                    :
                 Container(
                   height: 500,
                        child: ListView.builder(
                        itemCount: kamusArab.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(kamusArab[i].arab, style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "Mont",
                                      fontWeight: FontWeight.w500)),
                                  Text(kamusArab[i].arabLatin, style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "Avenir",
                                      fontWeight: FontWeight.w500)),
                                  Text(kamusArab[i].indo, style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "Avenir",
                                      fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          );
                        },
                      ))
              ],
            )),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 20),
          child: Image.asset(
            "assets/icon/learningarabiclogo.png",
            height: 150,
          ),
        ),
      ],
    );
  }
}

class BeginScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

// DataTable(
//                         columns: [
//                           DataColumn(
//                               label: Text('Arab',
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.black,
//                                       fontFamily: "Avenir",
//                                       fontWeight: FontWeight.w500))),
//                           DataColumn(
//                               label: Text('Arab Latin',
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.black,
//                                       fontFamily: "Avenir",
//                                       fontWeight: FontWeight.w500))),
//                           DataColumn(
//                               label: Text('Indonesia',
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.black,
//                                       fontFamily: "Avenir",
//                                       fontWeight: FontWeight.w500)),
//                               onSort: (i, b) {
//                                 setState(() {});
//                               }),
//                         ],
//                         rows: [
//                           DataRow(cells: [
//                             DataCell(Text("dsad")),
//                             DataCell(Text("ddas")),
//                             DataCell(Text("ddWW")),
//                           ]),
//                         ],
//                       ),
