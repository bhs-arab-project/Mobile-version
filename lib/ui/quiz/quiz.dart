part of '../uis.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with SingleTickerProviderStateMixin {
  AnimationController _animController;
  Animation<double> _animation;

  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animController);
    _animController.forward();
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
            height: size.height * 1 / 3,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: size.width * 0.07,
                      right: size.width * 0.04,
                      bottom: size.width * 0.05),
                  height: size.height * 0.7 - 27,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(size.width * 0.07),
                          bottomRight: Radius.circular(size.width * 0.07)),
                      image: DecorationImage(
                          image: AssetImage("assets/image/quizbackground.png"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          FadeTransition(
            opacity: _animation,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: displayWidth(context) * 0.02,
              ),
              child: Row(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(bottom: displayWidth(context) * 0.001),
                    height: displayHeight(context) * 0.035,
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: kDefaultPadding / 10),
                          child: Text(
                            "Programs Quiz",
                            style: TextStyle(
                                fontSize: displayWidth(context) * 0.05,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Avenir'),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: kDefaultPadding / 3),
                              height: 6,
                              color: Colors.amber.withOpacity(0.2),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SingleChildScrollView(
          //     scrollDirection: Axis.vertical,
          //     child:)
          ScrollConfiguration(
              behavior: QuizScroll(),
              child: Expanded(
                  child: SlideTransition(
                      position:
                          Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                              .animate(_animController),
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: displayWidth(context) * 0.08,
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/begconfirm');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          displayWidth(context) * 0.12),
                                      bottomRight: Radius.circular(
                                          displayWidth(context) * 0.12))),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      colors: [
                                        Colors.green[600],
                                        Colors.green[600],
                                        Colors.green[200]
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          displayWidth(context) * 0.12),
                                      bottomRight: Radius.circular(
                                          displayWidth(context) * 0.12)),
                                ),
                                child: Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 88.0,
                                        minHeight:
                                            100.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: displayWidth(context) *
                                                    0.05),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Beginner",
                                                  style: TextStyle(
                                                      fontSize: displayWidth(
                                                              context) *
                                                          0.075,
                                                      color: Colors.white,
                                                      fontFamily: 'Mont'),
                                                ),
                                                Text("Untuk 6-11 Tahun",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: displayWidth(
                                                                context) *
                                                            0.035,
                                                        color: Colors.white,
                                                        fontFamily: 'Mont')),
                                              ],
                                            )),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right:
                                                  displayWidth(context) * 0.05),
                                          child: Icon(Icons.stars,
                                              size:
                                                  displayWidth(context) * 0.11),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(height: displayHeight(context) * 0.02),
                          Container(
                            margin: EdgeInsets.only(
                              right: displayWidth(context) * 0.08,
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/inconfirm');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          displayWidth(context) * 0.12),
                                      bottomRight: Radius.circular(
                                          displayWidth(context) * 0.12))),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      colors: [
                                        Colors.orange[400],
                                        Colors.orange[400],
                                        Colors.orange[200]
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          displayWidth(context) * 0.12),
                                      bottomRight: Radius.circular(
                                          displayWidth(context) * 0.12)),
                                ),
                                child: Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 88.0,
                                        minHeight:
                                            100.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: displayWidth(context) *
                                                    0.05),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Intermediate",
                                                  style: TextStyle(
                                                      fontSize: displayWidth(
                                                              context) *
                                                          0.075,
                                                      color: Colors.white,
                                                      fontFamily: 'Mont'),
                                                ),
                                                Text("Untuk 12-15 Tahun",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: displayWidth(
                                                                context) *
                                                            0.035,
                                                        color: Colors.white,
                                                        fontFamily: 'Mont')),
                                              ],
                                            )),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right:
                                                  displayWidth(context) * 0.05),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.stars,
                                                  size: displayWidth(context) *
                                                      0.11),
                                              Icon(Icons.stars,
                                                  size: displayWidth(context) *
                                                      0.11)
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(height: displayHeight(context) * 0.02),
                          Container(
                            margin: EdgeInsets.only(
                              right: displayWidth(context) * 0.08,
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/inadvance');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          displayWidth(context) * 0.12),
                                      bottomRight: Radius.circular(
                                          displayWidth(context) * 0.12))),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      colors: [
                                        Colors.red[400],
                                        Colors.red[400],
                                        Colors.red[200]
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          displayWidth(context) * 0.12),
                                      bottomRight: Radius.circular(
                                          displayWidth(context) * 0.12)),
                                ),
                                child: Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 88.0,
                                        minHeight:
                                            100.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: displayWidth(context) *
                                                    0.05),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Advance",
                                                  style: TextStyle(
                                                      fontSize: displayWidth(
                                                              context) *
                                                          0.075,
                                                      color: Colors.white,
                                                      fontFamily: 'Mont'),
                                                ),
                                                Text("16 Tahun ke Atas",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: displayWidth(
                                                                context) *
                                                            0.035,
                                                        color: Colors.white,
                                                        fontFamily: 'Mont')),
                                              ],
                                            )),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right:
                                                  displayWidth(context) * 0.05),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.stars,
                                                  size: displayWidth(context) *
                                                      0.11),
                                              Icon(Icons.stars,
                                                  size: displayWidth(context) *
                                                      0.11),
                                              Icon(Icons.stars,
                                                  size: displayWidth(context) *
                                                      0.11)
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ))))
        ],
      ),
    );
  }
}

class QuizScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
