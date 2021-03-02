import 'package:bahasa_arab/form/sign_in.dart';
import 'package:bahasa_arab/viewModels/viewModels.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class RegisScreen extends StatefulWidget {
  @override
  _RegisScreenState createState() => _RegisScreenState();
}

class _RegisScreenState extends State<RegisScreen> {
  bool _obscureText = true;
  bool _isLoading = false;
  var roleValid;
  var nameValid;
  var emailValid;
  var passwordValid;
  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var xx = RegExp(r"user");
  TextEditingController role = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var emailvalid;
  var passwordvalid;
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

  void initState() {
    super.initState();
    role.text = "user";
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
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(340),
                      // bottomRight: Radius.circular(360),
                    ),
                    color: Colors.blue[300]),
              ),
              Container(
                padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Daftar menggunakan nama, email dan password",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Anda mendaftar sebagai user",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            TextFormField(
                              // enabled: false,
                              controller: role,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                // prefixIcon: Icon(
                                //   Icons.ac_unit,
                                //   color: Colors.white,
                                // )
                              ),
                              // onSaved: (e) => role = e,
                              validator: (roleValue) {
                                if (roleValue.isEmpty) {
                                  return "Tolong masukkan role";
                                }
                                if (!xx.hasMatch(roleValue)) {
                                  return "Tidak bisa mengisi value selain user";
                                }
                                roleValid = roleValue;
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            Text("Nama",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            TextFormField(
                              controller: name,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  prefixIcon: Icon(
                                    Icons.account_circle_rounded,
                                    color: Colors.white,
                                  )),
                              // onSaved: (e) {
                              //   name = e;
                              // },
                              validator: (nameValue) {
                                if (nameValue.isEmpty) {
                                  return "Tolong masukkan nama";
                                }
                                nameValid = nameValue;
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            Text("Email",
                                style: TextStyle(
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
                                    return "Tolong masukkan email";
                                  }
                                  emailValid = emailValue;
                                  return null;
                                }),
                            SizedBox(height: 10),
                            Text("Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            TextFormField(
                              obscureText: _obscureText,
                              keyboardType: TextInputType.visiblePassword,
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
                                  return "Tolong masukkan password";
                                }
                                passwordValid = passwordValue;
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              width: 140,
                              child: FlatButton(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 10, right: 10),
                                  child: Text(
                                    _isLoading ? 'Tunggu...' : 'Daftar',
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
                                    register();
                                    print('register dipencet');
                                  }
                                },
                              ),
                            ),
                            // Positioned(
                            //   child: (isLoading)
                            //       ? Center(
                            //           child: Container(
                            //               height: 26,
                            //               width: 26,
                            //               child: CircularProgressIndicator(
                            //                 backgroundColor: Colors.green,
                            //               )))
                            //       : Container(),
                            //   right: 30,
                            //   bottom: 0,
                            //   top: 0,
                            // )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("apa anda sudah punya akun? ",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 13)),
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                child: Text("Login disini",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blueGrey,
                                        fontSize: 13)),
                                onTap: () {
                                  print('hal login');
                                  Navigator.pop(context);
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             LoginScreen()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    registerUser(role.text, name.text, email.text, password.text).then((value) {
      setState(() {
        _isLoading = true;
      });
      setState(() {
        if (value == true) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false,
          );
        } else {
          AlertDialog alertDialog = AlertDialog(
            content: Container(
              height: 100.0,
              child: Column(
                children: [
                  Text("Login gagal"),
                  RaisedButton(
                    child: Text("OK"),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          );
          showDialog(context: context, child: alertDialog);
        }
      });
      setState(() {
        _isLoading = false;
      });
    });
  }
}
