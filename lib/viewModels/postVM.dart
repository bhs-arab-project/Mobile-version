part of 'viewModels.dart';

var dd = "http://10.0.2.198:8000/api";

_save(String token) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = token;
  prefs.setString(key, value);
}

read() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = prefs.get(key) ?? 0;
  print('read : $value');
}

var base = "https://base-data.herokuapp.com/api";

Future loginUser(String email, String password, BuildContext context) async {
  try {
    String token;
    int id;
    String role;
    String name;
    String emaile;
    var data = {"email": email, "password": password};
    // print(data);
    var url = "$base/login";
    var hasil = await http.post(url, body: (data));
    if (hasil.statusCode == 200) {
      if (token != null) {
        print("Token Boss");
      }
      token = (userModelFromJson(hasil.body)).token.token;
      id = (userModelFromJson(hasil.body)).user.id;
      role = (userModelFromJson(hasil.body)).user.role;
      name = (userModelFromJson(hasil.body)).user.name;
      emaile = (userModelFromJson(hasil.body)).user.email;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('tokenauto', token);
      prefs.setInt('idauto', id);
      prefs.setString('roleauto', role);
      prefs.setString('nameauto', name);
      prefs.setString('emailauto', email);
      final String userToken = prefs.getString(
        'tokenauto',
      );
      final int userId = prefs.getInt(
        'idauto',
      );
      final String userRole = prefs.getString(
        'roleauto',
      );
      final String userName = prefs.getString(
        'nameauto',
      );
      final String userEmail = prefs.getString(
        'emaiauto',
      );
      if (role == 'admin') {
        Flushbar(
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          title: "Login berhasil",
          message: "Lakukan tindakan yang tepat",
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        )..show(context).then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (contex) => HomeAdmin())));
      } else if (role == 'teacher') {
        Flushbar(
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          title: "Login berhasil",
          message: "Buatlah pelajaran yang bermanfaat untuk orang lain",
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        )..show(context).then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (contex) => HomeGuru())));
      }
      if (role == 'user') {
        Flushbar(
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          title: "Login berhasil",
          message: "Selamat belajar :)",
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        )..show(context).then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (contex) => Home())));
      }
      return true;
    } else if (hasil.statusCode == 403) {
      print('Verifikasi');
      return false;
    } else {
      print("Gagal login");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

Future registerUser(
    String role, String name, String email, String password) async {
  try {
    String token;
    Map data = {
      "role": role,
      "name": name,
      "email": email,
      "password": password
    };
    print(data);
    var url = "$base/register";
    http.Response hasil = await http.post(Uri.encodeFull(url),
        body: (data),
        headers: {
          "Accept": "application/json",
        },
        encoding: Encoding.getByName("utf-8"));
    if (hasil.statusCode == 200) {
      token = (userModelFromJson(hasil.body)).token.token;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('tokenauto', token);
      final String userToken = prefs.getString('tokenauto');
      print(userToken);
      print("Berhasil register");
      return true;
    } else {
      print("Gagal register");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

// class ModelGR {
//   Future loginUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final String userToken = prefs.getString('tokenauto');
//     final String role = prefs.getString('roleauto');
//     final String name = prefs.getString('nameauto');
//     final String emaile = prefs.getString('emailauto');
//     print(userToken);
//     print(role);
//     print(name);
//     print(emaile);

//     if (role == 'admin') {
//       print("admin role");
//       return "admin";
//     } else if (role == 'teacher') {
//       print("teacher role");
//       return "teacher";
//     } else if (role == 'user') {
//       print("user role");
//       return "user";
//     }

//     return true;t
//   }
// }
