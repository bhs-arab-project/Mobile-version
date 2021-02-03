part of '../../uis.dart';

class Pembelajaran extends StatefulWidget {
  Pembelajaran({Key key}) : super(key: key);

  @override
  _PembelajaranState createState() => _PembelajaranState();
}

class _PembelajaranState extends State<Pembelajaran> {
  // PageController controller =
  //     PageController(initialPage: 0, keepPage: true, viewportFraction: 0.8);
  // var currentPageValue = 0.0;

  // @override
  // void initState() {
  //   super.initState();
  //   controller.addListener(() {
  //     setState(() {
  //       currentPageValue = controller.page;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            color: Colors.white,
            onPressed: () {
              print('Balik Ke List');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListMateri()));
            }),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Pendahuluan", style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  height: MediaQuery.of(context).size.height / 1.3,
                  // width: double.infinity,
                  child: PageView.builder(
                    // itemCount: totalCards.toInt(),
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 20, bottom: 20),
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[350],
                                // blurRadius: 2.0,
                                offset: Offset(
                                  3.0,
                                  3.0,
                                ),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 25, left: 25, right: 25, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Tiger details",
                                            style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 15.0),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "The tiger (Panthera tigris) is the largest species among the Felidae and classified in the genus Panthera. It is most recognisable for its dark vertical stripes on orangish-brown fur with a lighter underside. It is an apex predator, primarily preying on ungulates such as deer and wild boar.",
                                            style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 15.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                    // controller: controller,
                  ),
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Text(
                //           "Select Card (${(currentPageValue + 1).floor()}/${totalCards.toInt()})",
                //           style: TextStyle(fontFamily: 'Roboto'),
                //         ),
                //         Container(
                //           margin: EdgeInsets.only(
                //             left: 40,
                //             right: 40,
                //           ),
                //           child: Slider(
                //             activeColor: Colors.blueGrey,
                //             min: 0,
                //             max: totalCards - 1,
                //             onChanged: (currentValue) {
                //               setState(() {
                //                 controller.animateToPage(currentValue.floor(),
                //                     duration: Duration(milliseconds: 200),
                //                     curve: Curves.easeInExpo);
                //               });
                //             },
                //             value: currentPageValue,
                //           ),
                //         ),
                //       ],
                //     ),
                //     SizedBox(
                //       height: 10,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
