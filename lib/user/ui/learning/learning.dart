import 'package:bahasa_arab/package/flushbar/flushbar.dart';
import 'package:bahasa_arab/package/text_field.dart';
import 'package:bahasa_arab/user/VM/view_model.dart';
import 'package:bahasa_arab/user/ui/learning/mapel/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Learning extends StatefulWidget {
  @override
  _LearningState createState() => _LearningState();
}

class _LearningState extends State<Learning>
    with SingleTickerProviderStateMixin {
  AnimationController _animController;
  Animation<double> _animation;
  TextEditingController searchController = new TextEditingController();
  String filter;

  var materiPelajaran;

  void dataPelajaran() {
    allPelajaran(context).then((value) {
      setState(() {
        materiPelajaran = value;
      });
    });
  }

  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final Animation curve =
        CurvedAnimation(parent: _animController, curve: Curves.fastOutSlowIn);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
    _animController.forward();
    super.initState();
    dataPelajaran();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Container(
      height: MediaQuery.of(context).size.height / 1.09,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2.8,
                  decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      image: DecorationImage(
                          image: AssetImage("assets/image/icon.png"),
                          fit: BoxFit.fitWidth)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3.50,
                      left: 30,
                      right: 30),
                  height: MediaQuery.of(context).size.height / 7.3,
                  child: Align(
                      alignment: Alignment.center,
                      child: BeautyTextfield(
                        controller: searchController,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w700,
                        width: double.maxFinite,
                        height: 55,
                        duration: Duration(milliseconds: 300),
                        inputType: TextInputType.text,
                        prefixIcon: Icon(Icons.search),
                        placeholder: "Mau belajar apa?",
                        onTap: () {
                          print('Click');
                        },
                        onChanged: (t) {
                          print(t);
                        },
                        // onChanged: onItemChanged,
                        onSubmitted: (d) {
                          print(d.length);
                        },
                      )),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text("Materi Pelajaran",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.start),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Container(
                        height: 2.5,
                        color: Colors.amber.withOpacity(0.2),
                      ))
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            materiPelajaran == null
                ? Center(
                    child: SpinKitThreeBounce(
                    color: Colors.blue[200],
                  ))
                : ScrollConfiguration(
                    // SingleChildScrollView(
                    behavior: LearningScroll(),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.26,
                      child: SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(1, 0), end: Offset(0, 0))
                              .animate(_animController),
                          // child: Text("Negtot"),
                          child: ListView.builder(
                              itemCount: materiPelajaran.length,
                              itemBuilder: (context, i) {
                                return filter == null || filter == ""
                                    ? Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 25.0,
                                              right: 25.0,
                                              bottom: 30.0,
                                            ),
                                            child: RaisedButton(
                                              onPressed: () {
                                                print('Daftar materi');
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return ListMateri(
                                                      id: materiPelajaran[i]
                                                              ['id']
                                                          .toString());
                                                }));
                                              },
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                topLeft: Radius.circular(23.0),
                                                topRight: Radius.circular(23.0),
                                                bottomLeft:
                                                    Radius.circular(23.0),
                                                bottomRight:
                                                    Radius.circular(23.0),
                                              )),
                                              padding: EdgeInsets.all(0.0),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(23.0),
                                                      topRight:
                                                          Radius.circular(23.0),
                                                      bottomLeft:
                                                          Radius.circular(23.0),
                                                      bottomRight:
                                                          Radius.circular(23.0),
                                                    )),
                                                child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 20.0,
                                                        right: 20.0,
                                                        bottom: 20.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Image.asset(
                                                              'assets/image/man.png',
                                                              height: 80),
                                                        ),
                                                        Container(
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                // Row(children: [

                                                                //   // FlatButton(
                                                                //   //   onPressed: () {
                                                                //   //     _showDialog();
                                                                //   //     print('hapus');
                                                                //   //   },
                                                                //   //   child: Text(
                                                                //   //     "Hapus",
                                                                //   //     style: TextStyle(
                                                                //   //         color: Colors.red,
                                                                //   //         fontFamily:
                                                                //   //             'Mont',
                                                                //   //         fontSize: 18.5,
                                                                //   //         fontWeight:
                                                                //   //             FontWeight
                                                                //   //                 .w800),
                                                                //   //   ),
                                                                //   // ),
                                                                // ]),
                                                                Text(
                                                                    materiPelajaran[
                                                                            i][
                                                                        'pelajaran'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontFamily:
                                                                            'Mont',
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight.w800)),
                                                                SizedBox(
                                                                  height: 20.0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Pengajar: ",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontFamily:
                                                                                'Avenir',
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w600)),
                                                                    Text(
                                                                        materiPelajaran[i]
                                                                            [
                                                                            'guru'],
                                                                        // "Fityan Ilham Wahyudi",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontFamily:
                                                                                'Avenir',
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w600)),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .assignment,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    Text(
                                                                        "Jumlah materi: ",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontFamily:
                                                                                'Avenir',
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w600)),
                                                                    materiPelajaran[i]['chapter'] ==
                                                                            null
                                                                        ? Text(
                                                                            "Belum ada",
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontFamily: 'Avenir',
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w600))
                                                                        : Text(materiPelajaran[i]['chapter'].toList().length.toString(), style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600))
                                                                  ],
                                                                )
                                                              ]),
                                                        ),
                                                        materiPelajaran[i][
                                                                    'tingkatan'] ==
                                                                'sulit'
                                                            ? Container(
                                                                margin: EdgeInsets.only(
                                                                    top: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        10),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(2),
                                                                height: 20,
                                                                width: 70,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    color: Colors
                                                                        .red),
                                                                child: Text(
                                                                    "sulit",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'Avenir')),
                                                              )
                                                            : materiPelajaran[i]
                                                                        [
                                                                        'tingkatan'] ==
                                                                    'menengah'
                                                                ? Container(
                                                                    margin: EdgeInsets.only(
                                                                        top: MediaQuery.of(context).size.height /
                                                                            10),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(2),
                                                                    height: 20,
                                                                    width: 70,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20),
                                                                        color: Colors
                                                                            .orange),
                                                                    child: Text(
                                                                        "menengah",
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                Colors.white,
                                                                            fontFamily: 'Avenir')),
                                                                  )
                                                                : Container(
                                                                    margin: EdgeInsets.only(
                                                                        top: MediaQuery.of(context).size.height /
                                                                            10),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(2),
                                                                    height: 20,
                                                                    width: 70,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20),
                                                                        color: Colors
                                                                            .green),
                                                                    child: Text(
                                                                        "mudah",
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                Colors.white,
                                                                            fontFamily: 'Avenir')),
                                                                  )
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 20,
                                            child: Container(
                                              child: Image.asset(
                                                  "assets/icon/beginlearn.png",
                                                  // height: 80,
                                                  width: 60),
                                            ),
                                          ),
                                        ],
                                      )
                                    : '${materiPelajaran[i]['pelajaran']} || ${materiPelajaran[i]['guru']}'
                                            .toLowerCase()
                                            .contains(filter.toLowerCase())
                                        ? Stack(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: 25.0,
                                                  right: 25.0,
                                                  bottom: 30.0,
                                                ),
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    print('Daftar materi');
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return ListMateri(
                                                          id: materiPelajaran[i]
                                                                  ['id']
                                                              .toString());
                                                    }));
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(23.0),
                                                    topRight:
                                                        Radius.circular(23.0),
                                                    bottomLeft:
                                                        Radius.circular(23.0),
                                                    bottomRight:
                                                        Radius.circular(23.0),
                                                  )),
                                                  padding: EdgeInsets.all(0.0),
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  23.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  23.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  23.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  23.0),
                                                        )),
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20.0,
                                                                right: 20.0,
                                                                bottom: 20.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              child: Image.asset(
                                                                  'assets/image/man.png',
                                                                  height: 80),
                                                            ),
                                                            Container(
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    // Row(children: [

                                                                    //   // FlatButton(
                                                                    //   //   onPressed: () {
                                                                    //   //     _showDialog();
                                                                    //   //     print('hapus');
                                                                    //   //   },
                                                                    //   //   child: Text(
                                                                    //   //     "Hapus",
                                                                    //   //     style: TextStyle(
                                                                    //   //         color: Colors.red,
                                                                    //   //         fontFamily:
                                                                    //   //             'Mont',
                                                                    //   //         fontSize: 18.5,
                                                                    //   //         fontWeight:
                                                                    //   //             FontWeight
                                                                    //   //                 .w800),
                                                                    //   //   ),
                                                                    //   // ),
                                                                    // ]),
                                                                    Text(
                                                                        materiPelajaran[i]
                                                                            [
                                                                            'pelajaran'],
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontFamily:
                                                                                'Mont',
                                                                            fontSize:
                                                                                17,
                                                                            fontWeight:
                                                                                FontWeight.w800)),
                                                                    SizedBox(
                                                                      height:
                                                                          20.0,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            "Pengajar: ",
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontFamily: 'Avenir',
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w600)),
                                                                        Text(
                                                                            materiPelajaran[i][
                                                                                'guru'],
                                                                            // "Fityan Ilham Wahyudi",
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontFamily: 'Avenir',
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w600)),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .assignment,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        Text(
                                                                            "Jumlah materi: ",
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontFamily: 'Avenir',
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w600)),
                                                                        materiPelajaran[i]['chapter']
                                                                                .isEmpty
                                                                            ? Text(
                                                                                "Belum ada",
                                                                                style: TextStyle(color: Colors.red, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                                                              )
                                                                            : Text(materiPelajaran[i]['chapter'].toList().length.toString(),
                                                                                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600))
                                                                      ],
                                                                    )
                                                                  ]),
                                                            ),
                                                            materiPelajaran[i][
                                                                        'tingkatan'] ==
                                                                    'sulit'
                                                                ? Container(
                                                                    margin: EdgeInsets.only(
                                                                        top: MediaQuery.of(context).size.height /
                                                                            10),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(2),
                                                                    height: 20,
                                                                    width: 70,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20),
                                                                        color: Colors
                                                                            .red),
                                                                    child: Text(
                                                                        "sulit",
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                Colors.white,
                                                                            fontFamily: 'Avenir')),
                                                                  )
                                                                : materiPelajaran[i]
                                                                            [
                                                                            'tingkatan'] ==
                                                                        'menengah'
                                                                    ? Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                MediaQuery.of(context).size.height / 10),
                                                                        alignment:
                                                                            Alignment.center,
                                                                        padding:
                                                                            EdgeInsets.all(2),
                                                                        height:
                                                                            20,
                                                                        width:
                                                                            70,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            color: Colors.orange),
                                                                        child: Text(
                                                                            "menengah",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 10,
                                                                                color: Colors.white,
                                                                                fontFamily: 'Avenir')),
                                                                      )
                                                                    : Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                MediaQuery.of(context).size.height / 10),
                                                                        alignment:
                                                                            Alignment.center,
                                                                        padding:
                                                                            EdgeInsets.all(2),
                                                                        height:
                                                                            20,
                                                                        width:
                                                                            70,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            color: Colors.green),
                                                                        child: Text(
                                                                            "mudah",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 10,
                                                                                color: Colors.white,
                                                                                fontFamily: 'Avenir')),
                                                                      )
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                right: 20,
                                                child: Container(
                                                  child: Image.asset(
                                                      "assets/icon/beginlearn.png",
                                                      // height: 80,
                                                      width: 60),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(
                                            // child: Text(
                                            //   "Pelajaran yang kamu cari tidak ada",
                                            //   style: TextStyle(
                                            //       fontFamily: "Mont",
                                            //       fontWeight: FontWeight.w500),
                                            // ),
                                            );
                              })),
                    ))
          ],
        ),
      ),
    );
  }
}

class LearningScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
