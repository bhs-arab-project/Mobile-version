import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bahasa_arab/guru/VM/guru_VM.dart';
import 'package:bahasa_arab/package/text_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Modal extends ModalRoute<void> {
  Modal({this.builder}) : super();

  final WidgetBuilder builder;
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.white.withOpacity(0.1);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: GetAll(),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}

class GetAll extends StatefulWidget {
  @override
  _GetAllState createState() => _GetAllState();
}

class _GetAllState extends State<GetAll> {
  TextEditingController searchController = new TextEditingController();
  String filter;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  var materiPelajaran;

  void pelajaran() {
    allPelajaran().then((value) {
      setState(() {
        materiPelajaran = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    pelajaran();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        materiPelajaran == null
            ? Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(20.0)),
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: TyperAnimatedTextKit(
                    speed: Duration(milliseconds: 200),
                    text: [
                      "Tunggu sebentar sedang memuat pelajaran",
                    ],
                    textStyle: TextStyle(
                        fontSize: 30.0,
                        fontFamily: "Poppins",
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : ScrollConfiguration(
                behavior: ListData(),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: HexColor("aed9e0"),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              spreadRadius: 5,
                              blurRadius: 7,
                            )
                          ]),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 17),
                        child: ListView.builder(
                          itemCount: materiPelajaran.length,
                          itemBuilder: (context, i) {
                            // print(
                            //     );
                            return filter == null || filter == ""
                                ? Container(
                                    height:
                                        MediaQuery.of(context).size.height / 7,
                                    margin: EdgeInsets.only(
                                        top: 15.0, right: 15.0, left: 15.0),
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(13.0),
                                        color: HexColor("ffffff")),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              7,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/image/man.png'),
                                                radius: 30.0,
                                              ),
                                              Container(
                                                child: Text(
                                                  materiPelajaran[i]['guru'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Avenir',
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              7,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                materiPelajaran[i]['pelajaran'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Row(
                                                children: [
                                                  Text("Jumlah materi: ",
                                                      style: TextStyle(
                                                          fontFamily: 'Mont',
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  materiPelajaran[i]['chapter']
                                                          .isEmpty
                                                      ? Text(
                                                          "Belum ada",
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        )
                                                      : Text(
                                                          ": " +
                                                              materiPelajaran[i]
                                                                      [
                                                                      'chapter']
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
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : '${materiPelajaran[i]['pelajaran']} || ${materiPelajaran[i]['guru']}'
                                        .toLowerCase()
                                        .contains(filter.toLowerCase())
                                    ? Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                7,
                                        margin: EdgeInsets.only(
                                            top: 15.0, right: 15.0, left: 15.0),
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(13.0),
                                            color: HexColor("ffffff")),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  7,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/image/man.png'),
                                                    radius: 30.0,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      materiPelajaran[i]
                                                          ['guru'],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontFamily: 'Avenir',
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  7,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    materiPelajaran[i]
                                                        ['pelajaran'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Jumlah materi: ",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Mont',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                      materiPelajaran[i]
                                                                  ['chapter']
                                                              .isEmpty
                                                          ? Text(
                                                              "Belum ada",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )
                                                          : Text(
                                                              materiPelajaran[i]
                                                                      [
                                                                      'chapter']
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
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container();
                          },
                        ),
                      )),
                ),
              ),
        Container(
          margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
          child: BeautyTextfield(
            controller: searchController,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            width: double.maxFinite,
            height: 50,
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
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.cancel, size: 30.0, color: Colors.red),
          ),
        )
      ],
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
