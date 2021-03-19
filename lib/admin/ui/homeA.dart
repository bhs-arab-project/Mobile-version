import 'package:bahasa_arab/admin/VM/admin_VM.dart';
import 'package:bahasa_arab/admin/ui/list/list_guru.dart';
import 'package:bahasa_arab/admin/ui/list/list_murid.dart';
import 'package:bahasa_arab/auth/sign_in.dart';
import 'package:bahasa_arab/package/floatting_action_buble.dart';
import 'package:bahasa_arab/package/flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeAdmin(),
  ));
}

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin>
    with SingleTickerProviderStateMixin {
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  Animation<double> _animation;
  Animation<Color> _animateColor;
  Curve _curve = Curves.easeOut;
  AnimationController _animationController;

  var getUser;

  void dataUser() {
    UserViewModel().userGet().then((value) {
      setState(() {
        getUser = value;
      });
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    )..addListener(() {
        setState(() {});
      });

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    _animateColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));
    super.initState();
    dataUser();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
        floatingActionButton: FloatingActionBubble(
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title: "Edit Profile",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.edit_outlined,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
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
                                    labelText: 'Nama',
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Password',
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
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          RaisedButton(
                              color: Colors.green,
                              child: Text("Simpan",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {})
                        ],
                      );
                    });
              },
            ),
            // Floating action menu item
            Bubble(
              title: "Logout",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.logout,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _save('0');
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => new LoginScreen(),
                ));
              },
            ),
          ],

          // animation controller
          animation: _animation,

          // On pressed change animation statec
          onPress: () => _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),

          // Floating Action button Icon color
          iconColor: Colors.blue,

          // Flaoting Action button Icon
          iconData: Icons.menu,
          backGroundColor: Colors.white,
        ),
        body: Container(
            padding: EdgeInsets.all(22.0),
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    child: Container(
                      child: Text(
                        getUser == null ? "" : getUser[0]['name'],
                        style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/image/man.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 55.0),
                  child: Center(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 35.0),
                            child: Text(
                              "Murid",
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 1.53,
                                left: 15.0),
                            height: 1.5,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                            )),
                        SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: () {
                            print("Murid");
                            Navigator.push(context,
                                ModalMurid(builder: (context) => GetMurid()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/image/daftar_murid.png'))),
                            child: Stack(
                              children: [
                                Text(
                                  "Daftar Murid",
                                  style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 25),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Text(
                                    "Ketuk untuk membuka",
                                    style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 35.0),
                            child: Text(
                              "Guru",
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 1.53,
                                left: 15.0),
                            height: 1.5,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                            )),
                        SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListGuru()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/image/daftar_guru.png'))),
                            child: Stack(
                              children: [
                                Text(
                                  "Daftar Guru",
                                  style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 25),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Text(
                                    "Ketuk untuk membuka",
                                    style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
