part of '../../uis.dart';

class ListMateri extends StatefulWidget {
  @override
  _ListMateriState createState() => _ListMateriState();
}

class _ListMateriState extends State<ListMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.pink[900], Colors.cyan[700], Colors.blue[400]]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 75),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login",
                      style: TextStyle(color: Colors.white, fontSize: 70)),
                  SizedBox(height: 10),
                  Text("Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 25))
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )),
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[300]),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Masukkan Email Anda",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  fillColor: Colors.blue,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[300]),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Masukkan Password Anda",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  fillColor: Colors.blue,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                style: TextStyle(fontSize: 20),
                                obscureText: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Text("Forgot Password",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      SizedBox(height: 30),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.purple[900],
                        ),
                        child: Center(
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text("Login with social media",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue),
                                child: Center(
                                  child: Text("Facebook",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                )),
                          ),
                          SizedBox(height: 30),
                          Expanded(
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black),
                                child: Center(
                                  child: Text("Google",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                          Text("Register",
                              style: TextStyle(
                                  color: Colors.purple, fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
