part of '../../uis.dart';

class Advsession extends StatefulWidget {
  @override
  _AdvsessionState createState() => _AdvsessionState();
}

class _AdvsessionState extends State<Advsession> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.red[400], Colors.red[200]])),
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 70, right: 40),
                    height: size.height * 0.23 - 27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      SizedBox(height: 60),
                      Text(
                        'Quiz',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 30,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Advance',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Container(
                  height: 580,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "PADA PROGRAM ADVANCE",
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "TERDAPAT 2 SESI YANG HARUS DIJAWAB",
                            style: TextStyle(
                                fontFamily: "Avenir",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        margin: EdgeInsets.only(right: 30, top: 20, bottom: 20),
                        decoration: BoxDecoration(
                            color: Colors.red[900],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SESI 1",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: "Avenir",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Menerjemahkan Kalimat Bahasa Arab",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Avenir",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.topRight,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        margin: EdgeInsets.only(left: 30, top: 20, bottom: 20),
                        decoration: BoxDecoration(
                            color: Colors.red[900],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "SESI 2",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: "Avenir",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Melengkapi Kalimat",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Avenir",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/advance');
                          },
                          fillColor: Colors.red,
                          padding: EdgeInsets.all(30),
                          child: Text(
                            "MULAI KUIS",
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}

// onPressed: () {
//                                           Scaffold.of(context).showSnackBar(
//                                               SnackBar(
//                                                   content: Text(
//                                                       "Anda sedang berada di Sesi 1")));
//                                         },
