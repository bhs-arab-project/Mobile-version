part of '../uis.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.landscape
          ? SingleChildScrollView(child: ContentArea())
          : ContentArea(),
    );
  }
}

class ContentArea extends StatelessWidget {
  const ContentArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FormLogin(),
      ],
    );
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
                margin: const EdgeInsets.all(20.0),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Login Form",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
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
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       top: 20, bottom: 5, right: 15.0),
                      //   child: Align(
                      //     alignment: Alignment.bottomRight,
                      //     child: Text(
                      //       "! Forgot Password",
                      //       style: TextStyle(
                      //         color: Colors.red[300],
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(top: 30.0, right: 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                // Checkbox(value: false, onChanged: (_) {}),
                                // Text(
                                //   "Remember Me",
                                //   style: TextStyle(fontSize: 12),
                                // ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "! Forgot Password",
                                    style: TextStyle(
                                      color: Colors.red[300],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    print('Berhasil masuk');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Screen()));
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(80.0)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Colors.green,
                                          Colors.black
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(80.0)),
                                    ),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                          minWidth: 130.0, minHeight: 36.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Login',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25, bottom: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Apa Anda Tidak Mempunyai Akun?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25, bottom: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                child: Text(" daftar disini",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                              ),
                            ),
                          ),
                          // TextBu
                          // TextButton(
                          //       onPressed: () {
                          //         Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) => Register()));
                          //       },
                          //       child: Text('daftar disini',
                          //           style: TextStyle(
                          //             fontSize: 12,
                          //             color: Colors.grey,
                          //           )),
                          //     ),
                        ],
                      ),
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
