part of '../uis.dart';

class Learning extends StatefulWidget {
  @override
  _LearningState createState() => _LearningState();
}

class _LearningState extends State<Learning>
    with SingleTickerProviderStateMixin {
  List materiPelajaran;
  List materiDisplay;
  AnimationController _animController;
  Animation<double> _animation;
  TextEditingController filter = TextEditingController();

  void listMateri(BuildContext context) {
    getAllPelajaran(context).then((value) {
      setState(() {
        materiPelajaran = value;
      });
    });
  }

  void hapusMateri(String id) async {
    bool hapus = await deleteMateri(id);

    if (hapus == true) {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.green,
        content: Text("Berhasil menghapus materi"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.red,
        content: Text("Gagal menghapus materi"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
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
    listMateri(context);
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Widget dataMateri() {
      return materiPelajaran.isNotEmpty
          ? Container(
              height: MediaQuery.of(context).size.height / 2.26,
              child: SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                          .animate(_animController),
                  child: ListView.builder(
                      itemCount: materiPelajaran.length,
                      itemBuilder: (context, i) {
                        return Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  bottom: 30.0,
                                  top: 5.0),
                              child: RaisedButton(
                                onPressed: () {
                                  print('Daftar materi');
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ListMateri(
                                        id: materiPelajaran[i].id.toString());
                                  }));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(23.0),
                                  topRight: Radius.circular(23.0),
                                  bottomLeft: Radius.circular(23.0),
                                  bottomRight: Radius.circular(23.0),
                                )),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(23.0),
                                        topRight: Radius.circular(23.0),
                                        bottomLeft: Radius.circular(23.0),
                                        bottomRight: Radius.circular(23.0),
                                      )),
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                          bottom: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Image.asset(
                                                'assets/image/man.png',
                                                height: 80),
                                          ),
                                          Container(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(children: [
                                                    Text(
                                                        materiPelajaran[i]
                                                            .pelajaran,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily: 'Mont',
                                                            fontSize: 17.5,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800)),
                                                    FlatButton(
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    "Pemberitahuan"),
                                                                content: Text(
                                                                    "Anda yakin ingin menghapus pelajaran ${materiPelajaran[i].pelajaran}?"),
                                                                actions: <
                                                                    Widget>[
                                                                  FlatButton(
                                                                    child: Text(
                                                                        "Iya"),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      hapusMateri(materiPelajaran[
                                                                              i]
                                                                          .id
                                                                          .toString());
                                                                    },
                                                                  ),
                                                                  FlatButton(
                                                                    child: Text(
                                                                        "Tidak"),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                  )
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: Text(
                                                        "Hapus",
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontFamily: 'Mont',
                                                            fontSize: 18.5,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ),
                                                  ]),
                                                  Text("Pengajar:",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Avenir',
                                                          fontSize: 16.5,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  Text(materiPelajaran[i].guru,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Avenir',
                                                          fontSize: 17.0,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  SizedBox(height: 10),
                                                  Container(
                                                      child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.assignment,
                                                              color: Colors
                                                                      .tealAccent[
                                                                  300],
                                                              size: 20.0,
                                                            ),
                                                            Text(": ")
                                                          ]),
                                                      Text(
                                                          materiPelajaran[i]
                                                                  .jumlahMateri +
                                                              "Materi",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16,
                                                              color: Colors
                                                                      .blueGrey[
                                                                  800],
                                                              fontFamily:
                                                                  'Avenir')),
                                                    ],
                                                  )),
                                                ]),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    10),
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(2),
                                            height: 20,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.orangeAccent),
                                            child: Text(
                                                materiPelajaran[i].tingkatan,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.5,
                                                    color: Colors.white,
                                                    fontFamily: 'Avenir')),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 20,
                              child: Container(
                                child: Image.asset("assets/icon/beginlearn.png",
                                    // height: 80,
                                    width: 60),
                              ),
                            ),
                          ],
                        );
                      })),
            )
          : Text("Tidak ada materi",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.black,
                  fontFamily: 'Avenir'));
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      image: DecorationImage(
                          image: AssetImage("assets/image/icon1.png"),
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
                        controller: filter,
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
                          t = t.toLowerCase();
                          setState(() {
                            materiPelajaran.where((post) {
                              var materiJudul = post.pelajaran.toLowerCase();
                              return materiJudul.contains(t);
                            }).toList();
                          });
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
                    child: dataMateri()),
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
