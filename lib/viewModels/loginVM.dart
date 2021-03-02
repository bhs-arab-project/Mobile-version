part of 'viewModels.dart';

Future loginUser(String email, String password) async {
  try {
    String token;
    var data = {"email": email, "password": password};
    print(data);
    var url = "https://base-data.herokuapp.com/api/login";
    var hasil = await http.post(url, body: (data));
    if (hasil.statusCode == 200) {
      token = (userModelFromJson(hasil.body)).token.token;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('tokenauto', token);
      final String userToken = prefs.getString('tokenauto');
      print(userToken);
      print("Sukses login");
      return true;
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
    var data = {
      "role": role,
      "name": name,
      "email": email,
      "password": password
    };
    print(data);
    var url = "https://base-data.herokuapp.com/api/register";
    var hasil = await http.post(url, body: (data));
    if (hasil.statusCode == 200) {
      token = (userModelFromJson(hasil.body)).token.token;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('tokenauto', token);
      final String userToken = prefs.getString('tokenauto');
      print(userToken);
      print("Sukses register");
      return true;
    } else {
      print("Gagal register");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}
