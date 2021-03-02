import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Database {
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

  String serverUrl = "https://base-data.herokuapp.com/api";
  // String serverUrl = "https://cooperationv2.herokuapp.com/api";
  var status;

  var token;

  Future loginData(String email, String password) async {
    try {
      var isi = {"email": email, "password": password};
      print(isi);
      String myUrl = "$serverUrl/login";
      final response = await http.post(myUrl,
          headers: {'Accept': 'application/json'}, body: (isi));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        print('data : ${data["token"]}');
        _save(data["token"]);
      } else {
        print('data : ${data["error"]}');
      }
    } catch (e) {
      print('error pada $e');
    }
  }

  registerData(String role, String name, String email, String password) async {
    String myUrl = "$serverUrl/register";
    final response = await http.post(myUrl,
        headers: {'Accept': 'application/json'},
        body: {"name": "$name", "email": "$email", "password": "$password"});
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  Future<List> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/pelajaran";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    return json.decode(response.body);
  }

  void deleteData(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/products/$id";
    http.delete(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
}
