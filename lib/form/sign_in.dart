import 'package:bahasa_arab/form/sign_up.dart';
import 'package:bahasa_arab/user/home.dart';
import 'package:bahasa_arab/viewModels/viewModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var emailvalid;
  var passwordvalid;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(340),
                        // bottomRight: Radius.circular(360),
                      ),
                      color: Colors.blue[300]),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Login Dengan email dan password",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 70, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email",
                                  style: TextStyle(
                                      fontFamily: "Avenir",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              TextFormField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    )),
                                validator: (emailValue) {
                                  if (emailValue.isEmpty) {
                                    return 'Tolong masukkan email';
                                  }
                                  emailvalid = emailValue;
                                  return null;
                                },
                              ),
                              SizedBox(height: 35),
                              Text("Password",
                                  style: TextStyle(
                                      fontFamily: "Avenir",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              TextFormField(
                                obscureText: _obscureText,
                                controller: password,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(_obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    prefixIcon: Icon(
                                      Icons.vpn_key,
                                      color: Colors.white,
                                    )),
                                validator: (passwordValue) {
                                  if (passwordValue.isEmpty) {
                                    return 'Tolong masukkan password';
                                  }
                                  passwordvalid = passwordValue;
                                  return null;
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: FlatButton(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 10,
                                          right: 10),
                                      child: Text(
                                        _isLoading ? 'Tunggu...' : 'Masuk',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    color: Colors.white,
                                    disabledColor: Colors.grey,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0)),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        login();
                                        print('login dipencet');
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("apa anda belum punya akun? ",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.white,
                                              fontSize: 13)),
                                      Align(
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          child: Text("Daftar disini",
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.blueGrey,
                                                  fontSize: 13)),
                                          onTap: () {
                                            print("hal register");
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisScreen()));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void login() {
    loginUser(email.text, password.text).then((value) {
      setState(() {
        _isLoading = true;
      });
      setState(() {
        if (value == true) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home()),
            (Route<dynamic> route) => false,
          );
          // msg = "Success";
          // AlertDialog alertDialog = AlertDialog(
          //   content: Container(
          //     height: 100.0,
          //     child: Column(
          //       children: [
          //         Text("Login Berhasil"),
          //         RaisedButton(
          //           child: Text("OK"),
          //           onPressed: () => Navigator.pushAndRemoveUntil(
          //             context,
          //             MaterialPageRoute(builder: (context) => Home()),
          //             (Route<dynamic> route) => false,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
          // showDialog(context: context, child: alertDialog);
        } else {
          // AlertDialog alertDialog = AlertDialog(
          //   content: Container(
          //     height: 100.0,
          //     child: Column(
          //       children: [
          //         Text("Login gagal"),
          //         RaisedButton(
          //           child: Text("OK"),
          //           onPressed: () => Navigator.pop(context),
          //         )
          //       ],
          //     ),
          //   ),
          // );
          // showDialog(context: context, child: alertDialog);
        }
      });
    });
    setState(() {
      _isLoading = false;
    });
  }
}
