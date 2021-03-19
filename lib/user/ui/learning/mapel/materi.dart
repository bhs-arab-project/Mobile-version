import 'package:bahasa_arab/user/VM/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pembelajaran extends StatefulWidget {
  final String id;
  Pembelajaran({this.id});

  @override
  _PembelajaranState createState() => _PembelajaranState();
}

class _PembelajaranState extends State<Pembelajaran> {
  var materiSingle;
  PageController _controller = PageController(
    initialPage: 0,
  );

  void dataSingleBab() {
    singleMateri(widget.id).then((value) {
      setState(() {
        materiSingle = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    dataSingleBab();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // Widget singleMateri() {
    //   return materiSingle['chapter'].isEmpty
    //       ? Center(
    //           child: Text("Tidak ada Matari yang dibuat",
    //               style: TextStyle(
    //                   fontSize: 16.0,
    //                   fontFamily: 'Mont',
    //                   fontWeight: FontWeight.w700)))
    //       : ;
    // }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                print('Balik Ke List');
                Navigator.pop(context);
              }),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
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
          child: materiSingle == null
              ? Center(
                  child: Text("Tunggu sebentar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontFamily: 'Mont',
                          fontWeight: FontWeight.w700)))
              : PageView.builder(
                  itemCount: materiSingle.length,
                  itemBuilder: (context, i) {
                    // var materi = materiSingle['chapter'][i];
                    return Container(
                      margin: EdgeInsets.only(
                          top: 50.0, right: 15.0, left: 15.0, bottom: 30.0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: 15.0,
                                  right: 15.0,
                                  left: 15.0,
                                  bottom: 15.0),
                              child: Column(children: [
                                Text(materiSingle['judul_bab'],
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Mont',
                                        fontWeight: FontWeight.w700)),
                                SizedBox(height: 10.0),
                                Text(materiSingle['materi'],
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Roboto',
                                    ))
                              ]))),
                    );
                  },
                ),
        )
        // ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: [
        //     Container(
        //       margin: EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
        //       decoration: BoxDecoration(
        //           color: Colors.white, borderRadius: BorderRadius.circular(10)),
        //       child: Text("dsdas"),
        //     ),

        //   ],
        // )
        );
  }
}
