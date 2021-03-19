import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bahasa_arab/admin/VM/admin_VM.dart';
import 'package:bahasa_arab/package/flushbar/flushbar.dart';
import 'package:bahasa_arab/package/flutter_slidable/slidable.dart';
import 'package:bahasa_arab/package/flutter_slidable/slidable_action_pane.dart';
import 'package:bahasa_arab/package/flutter_slidable/slide_action.dart';
import 'package:bahasa_arab/package/text_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ModalMurid extends ModalRoute<void> {
  ModalMurid({this.builder}) : super();

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
        child: GetMurid(),
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

class GetMurid extends StatefulWidget {
  @override
  _GetMuridState createState() => _GetMuridState();
}

class _GetMuridState extends State<GetMurid> {
  var muridList;

  void dataUser() {
    user().then((value) {
      setState(() {
        muridList = value;
      });
    });
  }

  TextEditingController searchController = new TextEditingController();
  String filter;

  @override
  void initState() {
    super.initState();
    dataUser();
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

  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    alertAlignment: Alignment.topCenter,
  );

  void _showDialog() {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "",
      desc: "Apakah anda yaknin ingin menghapus user ini",
      buttons: [
        DialogButton(
          child: Text(
            "Oke",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => hapusUser(muridList['id'].toString()),
          gradient: LinearGradient(colors: [
            HexColor("#a8c66c"),
            HexColor("#2ecc71"),
          ]),
        ),
      ],
    ).show();
  }

  void hapusUser(String id) async {
    var hapus = await userDelete(id);

    if (hapus == true) {
      Flushbar(
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        message: "Berhasil menghapus materi",
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      )..show(context);
    } else {
      Flushbar(
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        message: "Gagal menghapus materi",
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      )..show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // void filter() {
    //   return filter = null
    //       ? Slidable(
    //           actionPane: SlidableDrawerActionPane(),
    //           actionExtentRatio: 0.25,
    //           child: Card(
    //             margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
    //             child: ListTile(
    //               leading: CircleAvatar(
    //                 backgroundImage: AssetImage("assets/image/man.png"),
    //               ),
    //               title: Text(muridList[i]['name'],
    //                   style: TextStyle(
    //                       fontFamily: 'Mont', fontWeight: FontWeight.w500)),
    //               subtitle: Text(muridList[i]['email'],
    //                   style: TextStyle(
    //                       fontFamily: 'Mont', fontWeight: FontWeight.w500)),
    //             ),
    //           ),
    //           actions: <Widget>[
    //             IconSlideAction(
    //               caption: 'Edit',
    //               color: Colors.blue,
    //               icon: Icons.archive,
    //               onTap: () => Flushbar(
    //                 flushbarPosition: FlushbarPosition.TOP,
    //                 flushbarStyle: FlushbarStyle.FLOATING,
    //                 mainButton: FlatButton(
    //                   shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(100.0)),
    //                   onPressed: () {},
    //                   child: Text(
    //                     "Oke",
    //                     style: TextStyle(color: Colors.amber),
    //                   ),
    //                 ),
    //                 margin: EdgeInsets.all(8),
    //                 borderRadius: 8,
    //                 title: "Pemberitahuan",
    //                 message: "Apakah anda ingin mengedit pelajaran ini",
    //                 backgroundColor: Colors.red,
    //                 duration: Duration(seconds: 10),
    //               )..show(context),
    //             ),
    //           ],
    //           secondaryActions: <Widget>[
    //             IconSlideAction(
    //                 caption: 'Hapus',
    //                 color: Colors.red,
    //                 icon: Icons.delete,
    //                 onTap: () => Flushbar(
    //                       flushbarPosition: FlushbarPosition.TOP,
    //                       flushbarStyle: FlushbarStyle.FLOATING,
    //                       mainButton: FlatButton(
    //                         shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(100.0)),
    //                         onPressed: () {},
    //                         child: Text(
    //                           "Oke",
    //                           style: TextStyle(color: Colors.amber),
    //                         ),
    //                       ),
    //                       margin: EdgeInsets.all(8),
    //                       borderRadius: 8,
    //                       title: "Pemberitahuan",
    //                       message: "Apakah anda ingin menghapus pelajaran ini",
    //                       backgroundColor: Colors.red,
    //                       duration: Duration(seconds: 10),
    //                     )..show(context)),
    //           ],
    //         )
    //       : '${muridList[i]['name']} || ${muridList[i]['email']}'
    //               .toLowerCase()
    //               .contains(filter.toLowerCase())
    //           ? Slidable(
    //               actionPane: SlidableDrawerActionPane(),
    //               actionExtentRatio: 0.25,
    //               child: Card(
    //                 margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
    //                 child: ListTile(
    //                   leading: CircleAvatar(
    //                     backgroundImage: AssetImage("assets/image/man.png"),
    //                   ),
    //                   title: Text(muridList[i]['name'],
    //                       style: TextStyle(
    //                           fontFamily: 'Mont', fontWeight: FontWeight.w500)),
    //                   subtitle: Text(muridList[i]['email'],
    //                       style: TextStyle(
    //                           fontFamily: 'Mont', fontWeight: FontWeight.w500)),
    //                 ),
    //               ),
    //               actions: <Widget>[
    //                 IconSlideAction(
    //                   caption: 'Edit',
    //                   color: Colors.blue,
    //                   icon: Icons.archive,
    //                   onTap: () => Flushbar(
    //                     flushbarPosition: FlushbarPosition.TOP,
    //                     flushbarStyle: FlushbarStyle.FLOATING,
    //                     mainButton: FlatButton(
    //                       shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(100.0)),
    //                       onPressed: () {},
    //                       child: Text(
    //                         "Oke",
    //                         style: TextStyle(color: Colors.amber),
    //                       ),
    //                     ),
    //                     margin: EdgeInsets.all(8),
    //                     borderRadius: 8,
    //                     title: "Pemberitahuan",
    //                     message: "Apakah anda ingin mengedit pelajaran ini",
    //                     backgroundColor: Colors.red,
    //                     duration: Duration(seconds: 10),
    //                   )..show(context),
    //                 ),
    //               ],
    //               secondaryActions: <Widget>[
    //                 IconSlideAction(
    //                     caption: 'Hapus',
    //                     color: Colors.red,
    //                     icon: Icons.delete,
    //                     onTap: () => Flushbar(
    //                           flushbarPosition: FlushbarPosition.TOP,
    //                           flushbarStyle: FlushbarStyle.FLOATING,
    //                           mainButton: FlatButton(
    //                             shape: RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.circular(100.0)),
    //                             onPressed: () {},
    //                             child: Text(
    //                               "Oke",
    //                               style: TextStyle(color: Colors.amber),
    //                             ),
    //                           ),
    //                           margin: EdgeInsets.all(8),
    //                           borderRadius: 8,
    //                           title: "Pemberitahuan",
    //                           message:
    //                               "Apakah anda ingin menghapus pelajaran ini",
    //                           backgroundColor: Colors.red,
    //                           duration: Duration(seconds: 10),
    //                         )..show(context)),
    //               ],
    //             )
    //           : Container();
    // }

    return Stack(
      children: [
        muridList == null
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
                      "Tunggu sebentar...",
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
                          itemCount: muridList.length,
                          itemBuilder: (context, i) {
                            return muridList[i]['role'] == "user"
                                ? Slidable(
                                    actionPane: SlidableDrawerActionPane(),
                                    actionExtentRatio: 0.25,
                                    child: Card(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 5),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/image/man.png"),
                                        ),
                                        title: Text(muridList[i]['name'],
                                            style: TextStyle(
                                                fontFamily: 'Mont',
                                                fontWeight: FontWeight.w500)),
                                        subtitle: Text(muridList[i]['email'],
                                            style: TextStyle(
                                                fontFamily: 'Mont',
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                    secondaryActions: <Widget>[
                                      IconSlideAction(
                                          caption: 'Edit',
                                          color: Colors.blue,
                                          icon: Icons.archive,
                                          onTap: () {}),
                                      IconSlideAction(
                                          caption: 'Hapus',
                                          color: Colors.red,
                                          icon: Icons.delete,
                                          onTap: () => _showDialog()),
                                    ],
                                  )
                                : muridList[i]['role'] == "user".isEmpty
                                    ? Text("Tidak ada daftar murid",
                                        style: TextStyle(
                                            fontFamily: "Mont",
                                            fontWeight: FontWeight.w500))
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
            placeholder: "Siapa ingin anda cari?",
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
