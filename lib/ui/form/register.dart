part of '../uis.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.landscape
          ? SingleChildScrollView(child: ContentBar())
          : ContentBar(),
    );
  }
}

class ContentBar extends StatelessWidget {
  const ContentBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [SignUp()],
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            decoration: BoxDecoration(
              color: Colors.white10,
              image: DecorationImage(
                image: AssetImage('assets/image/icon2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                margin: EdgeInsets.all(20.0),
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Register Form',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.person,
                            color: Colors.blue[300],
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          labelText: "UserName : ",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.blue[300],
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          labelText: "Email : ",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue[300],
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          labelText: "Password : ",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10, right: 5),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: RaisedButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: <Color>[
                                  Colors.green,
                                  Colors.black54
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80.0)),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                    minWidth: 130.0, minHeight: 36.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Register',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Apa anda sudah mempunyai akun?',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                child: Text(" klik disini",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
