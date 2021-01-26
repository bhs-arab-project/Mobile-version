part of '../../uis.dart';

// PAGEVIEW
class InterLearn extends StatefulWidget {
  @override
  _InterLearnState createState() => _InterLearnState();
}

class _InterLearnState extends State<InterLearn> {
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
      backgroundColor: HexColor("#fab838"),
      body: ScrollConfiguration(
          behavior: InterScroll(),
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                children: <Widget>[
                  TitleInter(),
                  VerbalNominal(),
                  KalimatVerbal(),
                  VerbalPositif(),
                  VerbalTanya(),
                  VerbalTanya1(),
                  VerbalTanya2(),
                  VerbalNegatif(),
                  VerbalNegatif1(),
                ],
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 20, bottom: 40),
                  child: FloatingActionButton(
                    backgroundColor: HexColor("#fab838"),
                    foregroundColor: Colors.white,
                    splashColor: Colors.white38,
                    tooltip: "Back | To Learning Page",
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Icon(Icons.arrow_back),
                  ))
            ],
          )),
    );
  }
}

// TITLE
class TitleInter extends StatelessWidget {
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
                "assets/icon/learningarabicyellow.png",
                height: 270,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Intermediate",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
                alignment: Alignment.center,
                child: Text("Learning Session",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 20.2,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ))),
            SizedBox(height: 50),
            FlatButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: BorderSide(color: HexColor("#fab838"), width: 1.5)),
                child: Text("GET STARTED",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Avenir")))
          ],
        ));
  }
}

// CONTENT
class VerbalNominal extends StatelessWidget {
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
                        color: HexColor("#fab838"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text("Kalimat Verbal &",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, bottom: 5),
                          child: Text("Kalimat Nominal",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 20,
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
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    children: [
                      Text(
                          "        Sebelum memulai belajar bahasa Arab modern, ketahui lebih dulu bahwa kalimat dalam bahasa Arab ada dua macam yaitu: a) Kalimat Verbal, dan b) Kalimat Nominal",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify),
                      SizedBox(height: 15),
                      Text(
                          "        Kalimat Verbal adalah kalimat yang predikatnya berupa kata kerja (fi’il). Dalam bahasa Arab disebut jumlah fi’liyah. Unsur jumlah fi’liyah terdiri dari: a) fi’il (predikat) dan fa’il (subyek) atau b) fi’il, fa’il dan maf’ul (obyek).",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify),
                      SizedBox(height: 15),
                      Text(
                          "        Kalimat nominal adalah kalimat yang subyek dan predikatnya berupa kata benda (isim). Kalimat nominal dalam bahasa Arab disebut Jumlah Ismiyah yaitu kalimat yang terdiri dari mubtada’ (subyek) dan khobar (predikat).",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify),
                      Image.asset("assets/image/unsurjumlahfiil.png",
                          height: 205),
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

class KalimatVerbal extends StatelessWidget {
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
                        color: HexColor("#fab838"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text("Kalimat Verbal",
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
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bentuk Fi’il Ada Tiga:",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: '1. ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Madhi',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: '2. ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Mudharik',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: '3. ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Amar',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                          "Dari segi waktu dan bentuk (shighat), fi’il atau kata kerja dalam bahasa Arab ada tiga macam, yaitu:",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'a) Fi’il mudharik ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'dipakai untuk menunjukkan waktu sekarang atau yang akan datang atau kegiatan sehari-hari.',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                                text: 'b) Fi’il madhi ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'untuk menunjukkan masa yang sudah lalu.',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                                text: 'c) Fi’il amar ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'dipakai untuk kalimat perintah (kalam amar)',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                          SizedBox(height: 10),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(height: 10),
                          Text("Jenis Kalimat Verbal (Jumlah Fi'Iliyah)",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Roboto",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Text(
                              "Dari segi penggunaannya dalam berkomunikasi, jumlah fi’liyah terbagi menjadi lima macam yaitu:",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Roboto",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          RichText(
                            text: TextSpan(
                                text: 'a) Kalimat Positif ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '(kalam mutsbat)',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                                text: 'b) Kalimat Tanya ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '(kalam istifham)',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                                text: 'c) Kalimat Negatif/Menyangkal ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '(kalam nafi)',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                                text: 'd) Kalimat Perintah ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '(kalam amar), dan',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                                text: 'd) Kalimat Larangan ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '(kalam nahi)',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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

class VerbalPositif extends StatelessWidget {
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
                        color: HexColor("#fab838"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text("Jenis Kalimat Verbal",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20, bottom: 20),
                            child: Text("Kalimat Positif | Beginner",
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 13,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1. Kalimat Positif (Kalam Musbat)",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                                text: 'Kalimat Positif (Kalam Musbat) ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'adalah kalimat berita yang di dalamnya terdapat pengakuan terjadinya sesuatu.',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text("Contoh :",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Ali mengunjungi Hasan",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "َلِي يَزُوْرُ حَسَن",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Fatimah mencuci dengan sabun",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "فَاطِمَةُ تَغْسِلُ بِالصَابُوْن",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hasan makan dengan sendok",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "حَسَن يَأكُلُ بِالمِلُعَقَة",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fatimah makan dengan sendok",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "فَاطِمَةُ تَأكُلُ بِالِملْعَقَة",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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

class VerbalTanya extends StatelessWidget {
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
                        color: HexColor("#fab838"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text("Jenis Kalimat Verbal",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20, bottom: 20),
                            child: Text("Kalimat Tanya | Beginner",
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 13,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("2. Kalimat Tanya (Kalam Istifham)",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                                text: 'Kalimat Tanya (Kalam Istifham) ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'adalah kalimat yang mengandung makna sebuah pertanyaan. Arti kalimat tanya adalah kalimat yang berisi pertanyaan kepada pihak lain untuk memperoleh jawaban dari pihak yang ditanya. Dalam bahasa Arab kalimat tanya disebut kalam istifham.',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  )
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                          "Cara membuat kalam istifham adalah dengan menambahkan kata tanya (adawat istifham) sebelum kalimat berita di atas. Kata tanya yang sering dipakai dalam bahasa Arab adalah sebagai berikut:",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify),
                      SizedBox(height: 15),
                      Text("Contoh :",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Apakah Ali mengunjungi Hasan?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "عَلِيٌ يَزُوْرُ حَسَن ؟",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Apakah  أ (همزة)",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Apakah Hasan mengunjungi Ali?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "هَلْ حَسَن يَزُوْرُ عَلِي ؟",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Apakah  هَلْ",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: FlatButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text("SWIPE FOR ANOTHER EXAMPLE",
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
                  ),
                ),
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

class VerbalTanya1 extends StatelessWidget {
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
                        color: HexColor("#fab838"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text("Jenis Kalimat Verbal",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20, bottom: 20),
                            child: Text("Kalimat Tanya | Beginner",
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 13,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Siapa yang makan dengan sendok?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "مَنْ يَأكُلُ بِالمِلْعَقَة؟",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Siapa  مَنْ",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Sejak kapan kamu mencuci dengan sabun?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "نْذُ مَتيَ تَغْسِلُ بِالصَّابُوْن؟",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Sejak kapan  مُنْذً",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Apa yang kamu makan?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "مَا تَأكُلُ؟",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Apa  مَا",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Apa yang Hasan makan?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "مَاذَا حَسَن يَأكُلُ؟",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Apa  مَاذَا",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Kapan kamu pergi ke sekolah?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "مَتَي تَذْهَبُ إليَ المَدْرَسَة؟",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Kapan  مَتَي",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      // BATAS
                    ],
                  ),
                ),
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

class VerbalTanya2 extends StatelessWidget {
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
                        color: HexColor("#fab838"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text("Jenis Kalimat Verbal",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20, bottom: 20),
                            child: Text("Kalimat Tanya | Beginner",
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 13,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Di mana kamu makan?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "أيْنَ تَأكُلُ؟",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Di mana  أيْنَ",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Bagaimana kamu makan?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "كَيْفَ تَأكُلُ؟",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Bagaimana  كَيْفَ",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Jam berapa kamu sarapan?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "كَمِ السَاعَةُ تُفْطِرُ؟",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Berapa  كَمْ",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("END OF EXAMPLE",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      )
                      // BATAS
                    ],
                  ),
                ),
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

class VerbalNegatif extends StatelessWidget {
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
                        color: HexColor("#fab838"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text("Jenis Kalimat Verbal",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20, bottom: 20),
                            child: Text("Kalimat Negatif | Beginner",
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 13,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("3. Kalimat Negatif (Kalam Nafi)",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                                text: 'Kalimat Negatif (Kalam Nafi) ',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'adalah kalimat yang bersifat menyangkal sehingga dalam kalimat negatif selalu terdapat kata “tidak” , “bukan” atau kata lain yang berupa penyangkalan. Kalimat negatif adalah lawan dari kalimat positif. Dalam bahasa Arab, kalimat negatif disebut kalam nafi atau kalam manfi.',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                          "Cara membuat kalam nafi dalam jumlah fi’liyah adalah dengan menambah kata nafi (sangkalan) sebelum kalimat berita. Kata nafi yang sering dipakai dalam jumlah fi’liyah adalah sebagai berikut:",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify),
                      SizedBox(height: 15),
                      Text("Contoh :",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Aku tidak pergi ke sekolah",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "لاَ أذْهَبُ إليَ المَدْرَسَة",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Tidak, bukan  لا",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Kamu tidak pergi ke kantor",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "مَا تَذْهَبُ إليَ المَكْتَب",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Tidak  مَا",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: FlatButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text("SWIPE FOR ANOTHER EXAMPLE",
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
                      // BATAS
                    ],
                  ),
                ),
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

class VerbalNegatif1 extends StatelessWidget {
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
                        color: HexColor("#fab838"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text("Jenis Kalimat Verbal",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20, bottom: 20),
                            child: Text("Kalimat Negatif | Beginner",
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 13,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Kamu tidak makan dengan sendok",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "لَمْ تَأكُلْ بِالمِلْعَقَة",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Tidak  لَمْ",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Aku belum sarapan hari ini",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "لمَّا اًفْطِرْاليَوْم",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Arabic",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Belum  لَمَّا",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roboto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("END OF EXAMPLE",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      )
                      // BATAS
                    ],
                  ),
                ),
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

// FUNCTION
class InterScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
