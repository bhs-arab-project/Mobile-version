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
                  backgroundImage: AssetImage('assets/image/man.png'),
                  radius: 60.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text("Wahyu",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Pelajar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.bold))
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
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
        child: ListView(
          children: [
            ListTile(
              title: Text("Wahyu321@gmail.com",
                  style: TextStyle(color: Colors.black)),
              subtitle: Text("Email"),
            ),
            ListTile(
              title: Text("Wahyu", style: TextStyle(color: Colors.black)),
              subtitle: Text("Name"),
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
                      onTap: () {},
                      leading: Icon(
                        Icons.mode_edit,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        "Edit Your Account",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Mont"),
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.donut_large,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        "My Progress",
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
      )
    ]);
  }
}
