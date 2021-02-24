part of '../uis.dart';

class RegisScreen extends StatefulWidget {
  @override
  _RegisScreenState createState() => _RegisScreenState();
}

class _RegisScreenState extends State<RegisScreen> {
  String role, name, email, password;
  final _key = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  TextEditingController _roleController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  signup(role, name, email, password) async {
    setState(() {
      isLoading = true;
    });
    print("Calling");

    Map data = {
      'role': role,
      'email': email,
      'password': password,
      'name': name
    };
    print(data.toString());
    final response = await http.post("http://10.0.2.101:8000/api/register",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Anda sudah mendaftar silahkan login")));
      Navigator.pop(context);
      // Map<String, dynamic> resposne = jsonDecode(response.body);
      // if (!resposne['error']) {
      //   Map<String, dynamic> user = resposne['data'];
      //   print(" User name ${user['data']}");
      //   savePref(
      //       1, user['role'], uscer['name'], user['email'], user['password']);
      //   Navigator.pop(context);
      //   return true;
      // } else {
      //   print(" ${resposne['message']}");
      // }
      // _scaffoldKey.currentState
      //     .showSnackBar(SnackBar(content: Text("${resposne['message']}")));
    } else {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Silahkan coba lagi")));
    }
  }

  savePref(
    int value,
    String role,
    String name,
    String email,
    String password,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt("value", value);
    preferences.setString("role", role);
    preferences.setString("name", name);
    preferences.setString("email", email);
    preferences.setString("password", password);
    preferences.commit();
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
                  height: MediaQuery.of(context).size.height / 1,
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
                        key: _key,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 70, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Role",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              TextFormField(
                                controller: _roleController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    prefixIcon: Icon(
                                      Icons.ac_unit,
                                      color: Colors.white,
                                    )),
                                onSaved: (value) => role = value,
                              ),
                              SizedBox(height: 10),
                              Text("Nama",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              TextFormField(
                                controller: _nameController,
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
                                onSaved: (e) => name = e,
                              ),
                              SizedBox(height: 10),
                              Text("Email",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              TextFormField(
                                controller: _emailController,
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
                                onSaved: (e) => email = e,
                              ),
                              SizedBox(height: 10),
                              Text("Password",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                controller: _passwordController,
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
                                onSaved: (e) => password = e,
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.only(top: 40),
                                width: 140,
                                child: RaisedButton(
                                  onPressed: () {
                                    if (isLoading) {
                                      return;
                                    }
                                    if (_roleController.text.isEmpty) {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Colors.orange,
                                        content: Text("Tolong masukkan role"),
                                      ));
                                      return;
                                    }
                                    if (_nameController.text.isEmpty) {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Colors.orange,
                                        content: Text("Tolong masukkan nama"),
                                      ));
                                      return;
                                    }
                                    if (_emailController.text.isEmpty) {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Colors.orange,
                                        content: Text("Tolong masukkan email"),
                                      ));
                                      return;
                                    }
                                    if (!reg.hasMatch(_emailController.text)) {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Colors.orange,
                                        content: Text("Email tidak sesuai"),
                                      ));
                                      return;
                                    }

                                    if (_passwordController.text.isEmpty) {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Colors.orange,
                                        content:
                                            Text("Tolong masukkan password"),
                                      ));
                                      return;
                                    }

                                    if (_passwordController.text.length < 8) {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Colors.orange,
                                        content: Text(
                                            "Password harus lebih dari 8 karakter"),
                                      ));
                                      return;
                                    }
                                    signup(
                                        _roleController.text,
                                        _nameController.text,
                                        _emailController.text,
                                        _passwordController.text);
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Text(
                                    "Sign Up",
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
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
        ));
  }
}
