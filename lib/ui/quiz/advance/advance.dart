part of '../../uis.dart';

class Advance extends StatefulWidget {
  @override
  _AdvanceState createState() => _AdvanceState();
}

class _AdvanceState extends State<Advance> {
  String jawaban = "";
  TextEditingController controller = TextEditingController();
  List dataSoalOk;

  void dataSoal() {
    getSoalAdvan(context).then((value) {
      setState(() {
        dataSoalOk = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    dataSoal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.red[400], Colors.red[200]],
          begin: Alignment.topCenter,
        )),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 25.0, right: 5.0, top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Quiz',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 30,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Advance',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 15,
                            color: const Color(0x7cdbf1ff),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    RawMaterialButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        elevation: 0,
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                        child: Icon(Icons.arrow_back, color: Colors.white))
                  ],
                ),
              ),
              dataSoalOk == null
                  ? Center(child: SpinKitThreeBounce(color: Colors.red[600]))
                  : Container(
                      height: 550,
                      padding: const EdgeInsets.only(left: 12),
                      child: Swiper(
                        itemCount: dataSoalOk.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 20,
                        layout: SwiperLayout.STACK,
                        pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              activeSize: 20,
                              space: 8,
                              activeColor: Colors.red),
                        ),
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {},
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: 60),
                                    Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30.0,
                                            right: 20.0,
                                            top: 40.0,
                                            bottom: 55.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  dataSoalOk[i].soal,
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 44,
                                                    color:
                                                        const Color(0xff47455f),
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 35),
                                            Text(
                                              '(TERJEMAHKAN KALIMAT TERSEBUT KE BAHASA INDONESIA)',
                                              style: TextStyle(
                                                fontFamily: 'Mont',
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 15),
                                            Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    top: 10,
                                                    left: 25,
                                                    right: 35),
                                                padding: EdgeInsets.only(
                                                    right: 20,
                                                    left: 10,
                                                    bottom: 5,
                                                    top: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.red),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      dataSoalOk[i].bahasaArab,
                                                      style: TextStyle(
                                                        fontFamily: 'Arabic',
                                                        fontSize: 25,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                )),
                                            SizedBox(height: 35),
                                            TextField(
                                              autofocus: true,
                                              controller: controller,
                                              keyboardType: TextInputType.text,
                                              textAlign: TextAlign.center,
                                              textCapitalization:
                                                  TextCapitalization.characters,
                                              maxLines: 2,
                                              decoration: InputDecoration(
                                                  labelText: "Jawab :"),
                                              style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                              onChanged: (text) {
                                                jawaban = text;
                                              },
                                            ),
                                            SizedBox(height: 30),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: 100,
                                  top: 65,
                                  child: Text(
                                    "Quiz",
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 150,
                                      color: Colors.black.withOpacity(0.08),
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
