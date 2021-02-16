part of '../../uis.dart';

class Pembelajaran extends StatefulWidget {
  final String id;
  Pembelajaran({this.id});

  @override
  _PembelajaranState createState() => _PembelajaranState();
}

class _PembelajaranState extends State<Pembelajaran> {
  Map<String, dynamic> materiSingle;
  PageController _controller = PageController(
    initialPage: 0,
  );

  void dataSingleBab() {
    getSingleBab(widget.id).then((value) {
      setState(() {
        materiSingle = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    dataSingleBab();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Widget singleData() {
      return materiSingle['theory'].isEmpty
          ? Center(
              child: Text("Tidak ada data",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Mont',
                      fontWeight: FontWeight.w700)))
          : PageView.builder(
              itemCount: materiSingle['theory'].length,
              itemBuilder: (context, i) {
                var materi = materiSingle['theory'][i];
                return Container(
                  margin: EdgeInsets.only(
                      top: 50.0, right: 15.0, left: 15.0, bottom: 30.0),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                          margin: EdgeInsets.only(
                              top: 15.0, right: 15.0, left: 15.0, bottom: 15.0),
                          child: Column(children: [
                            Text(materiSingle['judul_bab'],
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Mont',
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 10.0),
                            Text(materi['materi'],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Roboto',
                                ))
                          ]))),
                );
              },
            );
    }

    return Scaffold(
        backgroundColor: Colors.blue[300],
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                print('Balik Ke List');
                Navigator.pop(context);
              }),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: materiSingle == null
            ? Center(
                child: Text("Tunggu sebentar",
                    style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Mont',
                        fontWeight: FontWeight.w700)))
            : singleData());
  }
}
