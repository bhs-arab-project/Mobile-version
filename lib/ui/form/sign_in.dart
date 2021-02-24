part of '../uis.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {'email': '', 'password': ''};

  Future _submit() async {
    // String url = 'https://absensi-project.herokuapp.com/api/v1/login';
    // var res = await http.get(url);
    // var jsonData = json.decode(res.body);
    // print(jsonData);
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Screen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width / 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(340),
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
                      padding: EdgeInsets.only(top: 70, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          TextFormField(
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Masukkan email';
                              }
                              if (!value.contains('@')) {
                                return 'Harus memiliki karakter @';
                              }
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                          ),
                          SizedBox(height: 10),
                          Text("Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Masukkan password';
                              }
                              if (value.length < 8) {
                                return 'Password harus lebih dari 8 karakter';
                              }
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 40),
                            width: 140,
                            child: RaisedButton(
                              onPressed: () {
                                _submit();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.green,
                            ),
                          ),
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
                          Text("apa anda belum punya akun? ",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontSize: 13)),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              child: Text("Daftar disini",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blueGrey,
                                      fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisScreen()));
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
          ],
        ),
      ),
    ));
  }
}
