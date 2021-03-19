import 'dart:convert';

import 'package:bahasa_arab/guru/model/guru_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

var base = "https://base-data.herokuapp.com/api";

Future user() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String userToken = prefs.getString('tokenauto');
  try {
    var url = "$base/user";
    var hasil = await http.get(
      url,
      headers: {"Authorization": "Bearer $userToken"},
    );
    if (hasil.statusCode == 200) {
      var data = json.decode(hasil.body);
      print("Berhasil menampilkan pelajaran");
      return data;
    } else {
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

Future userDelete(String id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String userToken = prefs.getString('tokenauto');
  try {
    var url = "$base/user/${id}";
    var hasil = await http.delete(
      url,
      headers: {"Authorization": "Bearer $userToken"},
    );
    if (hasil.statusCode == 200) {
      print("Berhasil menghapus user");
      return 'oke';
    } else {
      return 'pea';
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

UserModel data;

class UserViewModel {
  Future userGet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userToken = prefs.getString('tokenauto');
    final String role = prefs.getString('roleauto');
    final String name = prefs.getString('nameauto');
    final String emaile = prefs.getString('emailauto');
    var data = [
      {
        'name': name,
        'email': emaile,
        'role': role,
      }
    ];
    return data;
  }
}

Future deleteMateri(String id) async {
  try {
    var url = "$base/pelajaran/${id}";
    var hasil = await http.delete(url);
    if (hasil.statusCode == 200) {
      print("Berhasil menghapus materi");
      return true;
    } else {
      print("Gagal menghapus materi");
      return false;
    }
  } catch (e) {
    print("Error pada catch $e");
    return false;
  }
}
