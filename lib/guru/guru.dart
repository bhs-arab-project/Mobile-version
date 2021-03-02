import 'package:flutter/material.dart';

class HomeGuru extends StatefulWidget {
  @override
  _HomeGuruState createState() => _HomeGuruState();
}

class _HomeGuruState extends State<HomeGuru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.0, left: 30.0, bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.height / 7,
                      ),
                      child: Text(
                        "Abu Hanifah",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Avenir'),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/image/man.png'),
                      radius: 25.0,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.only(top: 10.0, left: 20.0),
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage('assets/image/icon3.jpeg'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Materi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            )),
                        Text('Pelajaran',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 10,
                              left: MediaQuery.of(context).size.height / 4.5),
                          child: Text('Ketuk Untuk Membuka',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              )),
                        )
                      ],
                    )),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ListMateri()));
                },
              ),
              // SizedBox(height: 10),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('Selengkapnya',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 15)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey[300]),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      scrollable: true,
                                      title: Text('Edit Profile'),
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Form(
                                          child: Column(
                                            children: <Widget>[
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'nama depan',
                                                ),
                                              ),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'nama belakang',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        RaisedButton(
                                            color: Colors.red,
                                            child: Text("Batal",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                        RaisedButton(
                                            color: Colors.green,
                                            child: Text("Simpan",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            onPressed: () {})
                                      ],
                                    );
                                  });
                            },
                            leading: Icon(
                              Icons.mode_edit,
                            ),
                            title: Text(
                              "Edit Profile",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Mont"),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginScreen()));
                            },
                            leading: Icon(
                              Icons.backspace,
                            ),
                            title: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Mont"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
