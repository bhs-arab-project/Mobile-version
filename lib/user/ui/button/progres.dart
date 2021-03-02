import 'package:bahasa_arab/package/flutter_animation_progress_bar.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[300],
          centerTitle: true,
          title: Text("Progres Materi")),
      backgroundColor: Colors.blue[100],
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.height / 2,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 30, bottom: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 50.0,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/image/man.png'),
                          radius: 45.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Wahyu Medan",
                              style: TextStyle(
                                  fontFamily: "avenir",
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Pelajar",
                                  style: TextStyle(
                                      fontFamily: "avenir",
                                      fontWeight: FontWeight.w600)),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7))),
                                child: Text("Aktif",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: "Avenir",
                                      fontWeight: FontWeight.w500,
                                    )),
                              )
                            ],
                          ),
                          // SizedBox(height: 10),
                          // Text("Ust.Fauzan",
                          //     style: TextStyle(
                          //         fontFamily: "avenir",
                          //         fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nahwu",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "avenir",
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Container(
                        child: FAProgressBar(
                      currentValue: 80,
                      displayText: '%',
                    )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

// class CustomProgressIndicator extends StatefulWidget {
//   @override
//   _CustomProgressIndicatorState createState() =>
//       _CustomProgressIndicatorState();
// }

// class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
//   // double percent = 0.0;

//   // @override
//   // void initState() {
//   //   Timer timer;
//   //   timer = Timer.periodic(Duration(milliseconds: 100), (_) {
//   //     print('Percent Update');
//   //     setState(() {
//   //       percent += 1;
//   //       if (percent >= 50) {
//   //         timer.cancel();
//   //         // percent=0;
//   //       }
//   //     });
//   //   });
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: CircularPercentIndicator(
//       radius: 80.0,
//       lineWidth: 10.0,
//       animation: true,
//       percent: 0.7,
//       center: new Text(
//         "70.0%",
//         style: new TextStyle(
//             fontWeight: FontWeight.bold, fontSize: 12.0, fontFamily: "Avenir"),
//       ),
//       circularStrokeCap: CircularStrokeCap.round,
//       progressColor: Colors.green,
//       backgroundColor: Colors.grey[200],
//     ));
//   }
// }
