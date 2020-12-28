part of '../uis.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
  bool _lights = false;
  AnimationController animController;
  Animation<double> animate;

  @override
  void initState() {
    animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animate = Tween(begin: 0.0, end: 1.0).animate(animController);
    animController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: kDefaultPadding * 1.2),
            height: size.height * 1 / 3.8,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 70, right: 40, bottom: 50),
                  height: size.height * 0.7 - 27,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [Colors.yellow[700], Colors.yellow[300]])),
                ),
                Positioned(
                  bottom: 35.0,
                  left: 10,
                  right: 10.0,
                  child: SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(0, -5), end: Offset(0, 0))
                            .animate(animController),
                    // transformHitTests: ,
                    child: Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: ScrollConfiguration(
                            behavior: AccountScroll(),
                            child: Container(
                                height: 110,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 18,
                                                  bottom: 18,
                                                  left: 20,
                                                  right: 20),
                                              width:
                                                  displayWidth(context) * 0.200,
                                              height: displayHeight(context) *
                                                  0.100,
                                              decoration: BoxDecoration(
                                                  color: Colors.orange[100],
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "assets/image/profile.jpg",
                                                      ),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              80.0)),
                                                  border: Border.all(
                                                      color: Colors.orange[100],
                                                      width: 4.0)),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Yusuf Edogawa",
                                                  style: TextStyle(
                                                      fontFamily: "Avenir",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey[600]),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  "Kelas 3 SMK",
                                                  style: TextStyle(
                                                      fontFamily: "Avenir",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.grey[600]),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        text:
                                                            "Learning Status : ",
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontFamily: "Avenir",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 7),
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          7))),
                                                      child: Text("Aktif",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                            fontFamily:
                                                                "Avenir",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              color: Colors.white,
                                              child: CustomProgressIndicator()),
                                        ]),
                                  ],
                                )))),
                  ),
                ),
              ],
            ),
          ),
          Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: kDefaultPadding / 10),
                            child: Text(
                              "User Account Settings",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Avenir'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey[300]),
                            bottom: BorderSide(color: Colors.grey[300]))),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.mail_outline,
                        color: Colors.brown,
                        size: 30,
                      ),
                      title: Text("Change Email Address",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: "Mont",
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[300]))),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.mode_edit,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                      title: Text("Edit Your Account",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: "Mont",
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ),
                  ),
                ],
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: kDefaultPadding / 10),
                            child: Text(
                              "General Section",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Avenir'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey[300]),
                            bottom: BorderSide(color: Colors.grey[300]))),
                    child: SwitchListTile(
                      title: Text('Notification Sound',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: "Mont",
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      value: _lights,
                      onChanged: (bool value) {
                        setState(() {
                          _lights = value;
                        });
                      },
                      secondary: Icon(
                        Icons.notifications_none,
                        color: Colors.purple,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[300]))),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.share,
                        color: Colors.green,
                        size: 30,
                      ),
                      title: Text("Share this App",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: "Mont",
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[300]))),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.repeat,
                        color: Colors.red,
                        size: 30,
                      ),
                      title: Text("Reset All My Progress",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: "Mont",
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ),
                  ),
                  Ink(
                    color: Colors.red[400],
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text("Delete My Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Mont",
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ),
                  ),
                ],
              )),
            ],
          )),
        ],
      ),
    );
  }
}

class CustomProgressIndicator extends StatefulWidget {
  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  // double percent = 0.0;

  // @override
  // void initState() {
  //   Timer timer;
  //   timer = Timer.periodic(Duration(milliseconds: 100), (_) {
  //     print('Percent Update');
  //     setState(() {
  //       percent += 1;
  //       if (percent >= 50) {
  //         timer.cancel();
  //         // percent=0;
  //       }
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 10.0,
      animation: true,
      percent: 0.7,
      center: new Text(
        "70.0%",
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 12.0, fontFamily: "Avenir"),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.green,
      backgroundColor: Colors.grey[200],
    ));
  }
}

class AccountScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
