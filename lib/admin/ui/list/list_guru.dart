import 'package:bahasa_arab/admin/VM/admin_VM.dart';
import 'package:bahasa_arab/package/flushbar/flushbar.dart';
import 'package:bahasa_arab/package/swipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListGuru extends StatefulWidget {
  @override
  _ListGuruState createState() => _ListGuruState();
}

class _ListGuruState extends State<ListGuru> {
  TextEditingController filter = TextEditingController();
  var materiPelajaran;

  void dataGuru() {
    user().then((value) {
      setState(() {
        materiPelajaran = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    dataGuru();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(23.0),
                          bottomRight: Radius.circular(23.0)),
                      color: Colors.blue[400],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/image/icon.png')))),
              Container(
                margin: EdgeInsets.only(top: 30.0, left: 30.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Daftar Guru",
                    style: TextStyle(
                        fontFamily: 'Mont',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 1.5,
                width: MediaQuery.of(context).size.width / 1.25,
                child: Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 2),
                  decoration: BoxDecoration(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
          materiPelajaran == null
              ? Center(
                  child: SpinKitThreeBounce(
                  color: Colors.blue[200],
                ))
              : Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.5),
                  child: ScrollConfiguration(
                    // SingleChildScrollView(
                    behavior: LearningScroll(),
                    child: ListView.builder(
                        itemCount: materiPelajaran.length,
                        itemBuilder: (context, i) {
                          return materiPelajaran[i]['role'] == 'teacher'
                              ? GestureDetector(
                                  onLongPress: () {
                                    Flushbar(
                                      flushbarPosition: FlushbarPosition.TOP,
                                      flushbarStyle: FlushbarStyle.FLOATING,
                                      mainButton: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0)),
                                        onPressed: () {},
                                        child: Text(
                                          "Oke",
                                          style: TextStyle(color: Colors.amber),
                                        ),
                                      ),
                                      margin: EdgeInsets.all(8),
                                      borderRadius: 8,
                                      title: "Pemberitahuan",
                                      message:
                                          "Apakah anda ingin menghapus pelajaran ini",
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 10),
                                    )..show(context);
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    padding: EdgeInsets.all(10.0),
                                    margin: EdgeInsets.only(
                                        top: 20.0, right: 15.0, left: 15.0),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[300],
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                          )
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.69,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/image/man.png'),
                                                radius: 35.0,
                                              ),
                                              Text(
                                                materiPelajaran[i]['name'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.6,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  materiPelajaran[i]['email'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Jumlah pelajaran: ",
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    materiPelajaran[i]['lesson']
                                                            .isEmpty
                                                        ? Text(
                                                            "Belum ada",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          )
                                                        : Text(
                                                            materiPelajaran[i]
                                                                    ['lesson']
                                                                .toList()
                                                                .length
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container();
                        }),
                  ),
                ),
          Positioned(
              bottom: 5,
              left: 5,
              child: Row(
                children: [
                  SwipeTo(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      child: Text('Tambah guru',
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Poppins")),
                    ),
                    onRightSwipe: () {
                      print("Geser bos");
                      showDialog(
                        context: context,
                        builder: (_) => FunkyOverlay(),
                      );
                    },
                  ),
                ],
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Admin Page',
        child: Icon(Icons.arrow_back_sharp),
      ),
    );
  }
}

class FunkyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              height: MediaQuery.of(context).size.height / 2.1,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Tambah Akun Guru",
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40.0, left: 20, right: 20),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Masukkan nama",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(),
                                ),
                              ),
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Nama tidak boleh kosong";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Masukkan email",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(),
                                ),
                              ),
                              validator: (val) {
                                if (val.length == 0) {
                                  return "email tidak boleh kosong";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Masukkan password",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(),
                                ),
                              ),
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Password tidak boleh kosong";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 40.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      color: Colors.red,
                                      child: Text("Batal",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                  RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      color: Colors.green,
                                      child: Text("Simpan",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {})
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
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
