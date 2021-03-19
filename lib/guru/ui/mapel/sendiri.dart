import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bahasa_arab/guru/VM/guru_VM.dart';
import 'package:bahasa_arab/package/flushbar/flushbar.dart';
import 'package:bahasa_arab/package/flutter_slidable/slidable.dart';
import 'package:bahasa_arab/package/flutter_slidable/slidable_action_pane.dart';
import 'package:bahasa_arab/package/flutter_slidable/slide_action.dart';
import 'package:bahasa_arab/package/text_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ModalOnly extends ModalRoute<void> {
  ModalOnly({this.builder}) : super();

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
        child: GetOnly(),
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

class GetOnly extends StatefulWidget {
  @override
  _GetOnlyState createState() => _GetOnlyState();
}

class _GetOnlyState extends State<GetOnly> {
  var getUser;
  var materiPelajaran;

  void dataUser() {
    UserViewModel().userGet().then((value) {
      setState(() {
        getUser = value;
      });
    });
  }

  void dataPelajaran() {
    allPelajaran().then((value) {
      setState(() {
        materiPelajaran = value;
      });
    });
  }

  TextEditingController searchController = new TextEditingController();
  String filter;

  @override
  void initState() {
    super.initState();
    dataUser();
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
                      "......................................."
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
                child: Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: HexColor("aed9e0"),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            spreadRadius: 2,
                            blurRadius: 7,
                          )
                        ]),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 10),
                      child: ListView.builder(
                          itemCount: materiPelajaran.length,
                          itemBuilder: (context, i) {
                            return getUser[0]['id'] ==
                                    materiPelajaran[i]['user_id']
                                ? Slidable(
                                    actionPane: SlidableDrawerActionPane(),
                                    actionExtentRatio: 0.25,
                                    child: Container(
                                        padding: EdgeInsets.all(15.0),
                                        margin: EdgeInsets.only(bottom: 15.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              materiPelajaran[i]['pelajaran'],
                                              style: TextStyle(
                                                  fontFamily: 'Mont',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Center(
                                              child: Row(
                                                children: [
                                                  Text("Jumlah materi: ",
                                                      style: TextStyle(
                                                          fontFamily: 'Mont',
                                                          fontWeight:
                                                              FontWeight.w600)),
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
                                                          materiPelajaran[i]
                                                                  ['chapter']
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
                                            )
                                          ],
                                        )),
                                    actions: <Widget>[
                                      IconSlideAction(
                                        caption: 'Edit',
                                        color: Colors.blue,
                                        icon: Icons.archive,
                                        onTap: () => Flushbar(
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          flushbarStyle: FlushbarStyle.FLOATING,
                                          mainButton: FlatButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0)),
                                            onPressed: () {},
                                            child: Text(
                                              "Oke",
                                              style: TextStyle(
                                                  color: Colors.amber),
                                            ),
                                          ),
                                          margin: EdgeInsets.all(8),
                                          borderRadius: 8,
                                          title: "Pemberitahuan",
                                          message:
                                              "Apakah anda ingin mengedit pelajaran ini",
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 10),
                                        )..show(context),
                                      ),
                                    ],
                                    secondaryActions: <Widget>[
                                      IconSlideAction(
                                          caption: 'Hapus',
                                          color: Colors.red,
                                          icon: Icons.delete,
                                          onTap: () => Flushbar(
                                                flushbarPosition:
                                                    FlushbarPosition.TOP,
                                                flushbarStyle:
                                                    FlushbarStyle.FLOATING,
                                                mainButton: FlatButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Oke",
                                                    style: TextStyle(
                                                        color: Colors.amber),
                                                  ),
                                                ),
                                                margin: EdgeInsets.all(8),
                                                borderRadius: 8,
                                                title: "Pemberitahuan",
                                                message:
                                                    "Apakah anda ingin menghapus pelajaran ini",
                                                backgroundColor: Colors.red,
                                                duration: Duration(seconds: 10),
                                              )..show(context)),
                                    ],
                                  )
                                : Container();
                          }),
                    ))),
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
            placeholder: "Pelajaran apa yang anda ingin ubah?",
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
