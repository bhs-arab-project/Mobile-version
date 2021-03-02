import 'package:bahasa_arab/package/slide_panel.dart';
import 'package:bahasa_arab/user/VM/view_model.dart';
import 'package:bahasa_arab/user/ui/learning/mapel/materi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListMateri extends StatefulWidget {
  final String id;

  ListMateri({this.id});
  @override
  _ListMateriState createState() => _ListMateriState();
}

class _ListMateriState extends State<ListMateri> {
  // Map<String, dynamic> babSingle;
  var babSingle;

  void dataSingleMateri() {
    singlePelajaran(widget.id).then((value) {
      setState(() {
        babSingle = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    dataSingleMateri();
  }

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
    // Widget singleData() {
    //   return babSingle['chapter'].isEmpty
    //       ? Center(
    //           child: Text("TIdak ada data",
    //               style: TextStyle(
    //                   fontSize: 20.0,
    //                   fontFamily: 'Avenir',
    //                   fontWeight: FontWeight.w500,
    //                   color: Colors.white)))
    //       : ;
    // }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              print('Balik Ke Daftar');
              Navigator.pop(context);
            }),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage("assets/background/background.png"),
            //     fit: BoxFit.fill)
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.blue[700],
              Colors.blue[300],
              Colors.blue[100]
            ])),
        child: babSingle == null
            ? Center(
                child: Text("Tunggu sebentar",
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)))
            : SlidingUpPanel(
                panel: Center(
                  child: Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(left: 17.0, right: 17.0),
                      child: ScrollConfiguration(
                        behavior: ListData(),
                        child: ListView.builder(
                          itemCount: babSingle['chapter'].length,
                          itemBuilder: (context, i) {
                            var data = babSingle["chapter"][i];
                            return Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: RaisedButton(
                                onPressed: () {
                                  print('Materi');
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Pembelajaran(
                                        id: data['id'].toString());
                                  }));
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
                                    leading: Image.asset(
                                        "assets/icon/beginlearn.png",
                                        width:
                                            MediaQuery.of(context).size.width /
                                                13),
                                    title: Text(data['judul_bab'],
                                        style: TextStyle(fontFamily: 'Mont')),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    // onTap: () {
                                    // Navigator.pushNamed(context, '/belajar');
                                    // },
                                  )),
                                ),
                              ),
                            );
                          },
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
                body: Container(
                  child: Stack(
                    children: [
                      Container(
                          padding: EdgeInsets.all(14.0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 1.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          margin: EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //     height: MediaQuery.of(context).size.height / 15),
                              Text(babSingle['pelajaran'],
                                  style: TextStyle(
                                    fontFamily: "avenir",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                              SizedBox(height: 10.0),
                              Text(babSingle['deskripsi'],
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ))
                            ],
                          )),
                      Center(
                        child: Container(
                            child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: 45.0,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/man.png'),
                                radius: 70.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(babSingle['guru'],
                                style: TextStyle(
                                  fontFamily: "avenir",
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ))
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
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
