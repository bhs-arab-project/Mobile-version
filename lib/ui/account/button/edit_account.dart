part of '../../uis.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile"),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
              ),
              padding: EdgeInsets.only(left: 20),
              child: TextFormField(
                decoration:
                    InputDecoration(labelText: 'Email'),
              ),
            ),
            Container(
              // margin: EdgeInsets.only(
              //   top: MediaQuery.of(context).size.height / 20,
              // ),
              padding: EdgeInsets.only(left: 20),
              child: TextFormField(
                decoration:
                    InputDecoration(labelText: 'Nama'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
