part of '../uis.dart';

class Learning extends StatefulWidget {
  @override
  _LearningState createState() => _LearningState();
}

class _LearningState extends State<Learning>
    with SingleTickerProviderStateMixin {
  AnimationController _animController;
  Animation<double> _animation;

  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final Animation curve =
        CurvedAnimation(parent: _animController, curve: Curves.fastOutSlowIn);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
    _animController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 290,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/image/homescreenlearning.png"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 230,
                          left: 30,
                          right: 30),
                      height: 120,
                      child: Align(
                          alignment: Alignment.center,
                          child: BeautyTextfield(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w700,
                            width: double.maxFinite,
                            height: 60,
                            duration: Duration(milliseconds: 300),
                            inputType: TextInputType.text,
                            prefixIcon: Icon(Icons.lock_outline),
                            placeholder: "Mau belajar apa?",
                            onTap: () {
                              print('Click');
                            },
                            onChanged: (t) {
                              print(t);
                            },
                            onSubmitted: (d) {
                              print(d.length);
                            },
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 300),
                child: Container(
                  child: Stack(
                    children: [
                      FadeTransition(
                        opacity: _animation,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            "Pelajaran",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Avenir'),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 5,
                            color: Colors.amber.withOpacity(0.2),
                          ))
                    ],
                  ),
                ),
              ),
              ScrollConfiguration(
                behavior: LearningScroll(),
                child: Container(
                  height: 270,
                  child: SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                            .animate(_animController),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin:
                                  EdgeInsets.fromLTRB(25.0, 35.0, 35.0, 25.0),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/beginlearn');
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(23),
                                  topRight: Radius.circular(160),
                                  bottomLeft: Radius.circular(23),
                                  bottomRight: Radius.circular(23),
                                )),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          colors: [
                                            Colors.orange[100],
                                            Colors.blue[100]
                                          ]),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(23),
                                        topRight: Radius.circular(160),
                                        bottomLeft: Radius.circular(23),
                                        bottomRight: Radius.circular(23),
                                      )),
                                  child: Container(
                                    width: 400.0,
                                    child: Container(
                                      padding: EdgeInsets.all(30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("SHOROF",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      fontFamily: 'Avenir')),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(2),
                                                height: 25,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.green),
                                                child: Text("Beginner",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontFamily: 'Avenir')),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 23),
                                          Text("Mentor: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.blue,
                                                  fontFamily: 'Avenir')),
                                          Text("Abdul Malik",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontFamily: 'Avenir')),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.assignment,
                                                    color:
                                                        Colors.tealAccent[300],
                                                  ),
                                                  Text("10 Materi",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Avenir')),
                                                ],
                                              )),
                                              SizedBox(width: 100.0,),
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Text("Kesulitan",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Avenir')),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 250,
                              right: 0,
                              top: -25,
                              child: Container(
                                child: Image.asset("assets/icon/beginlearn.png",
                                    height: 170, width: 170),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
