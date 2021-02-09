part of '../uis.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            color: Colors.blue[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 50.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/image/man.png'),
                    radius: 45.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text("Webeeh10",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text("Pelajar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ],
      )),
      Positioned(
        top: MediaQuery.of(context).size.height / 2.7,
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            color: Colors.black,
          ),
          padding: EdgeInsets.only(
              top: 5, left: MediaQuery.of(context).size.height / 15),
          child: Text(
            "Info",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
      ScrollConfiguration(
        behavior: UserScroll(),
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
          child: ListView(
            children: [
              ListTile(
                title: Text("Wahyu321@gmail.com",
                    style: TextStyle(color: Colors.black)),
                subtitle: Text("email"),
              ),
              ListTile(
                subtitle: Text("selengkapnya"),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey[300]),
                        ),
                      ),
                      child: ListTile(
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
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                    RaisedButton(
                                        color: Colors.green,
                                        child: Text("Simpan",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {})
                                  ],
                                );
                              });
                        },
                        leading: Icon(
                          Icons.mode_edit,
                          color: Colors.blueAccent,
                        ),
                        title: Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Mont"),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sertifikat()));
                        },
                        leading: Icon(
                          Icons.book,
                          color: Colors.blueAccent,
                        ),
                        title: Text(
                          "Sertifikat",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Mont"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class UserScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
