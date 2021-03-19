import 'dart:convert';
import 'package:bahasa_arab/model/user.dart';
import 'package:bahasa_arab/package/flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonml/html2jsonml.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

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

Future allPelajaran(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String userToken = prefs.getString('tokenauto');
  try {
    var url = "$base/pelajaran";
    var hasil = await http.get(
      url,
      headers: {"Authorization": "Bearer $userToken"},
    );
    if (hasil.statusCode == 200) {
      var data = json.decode(hasil.body);
      // print(data[0]['pelajaran']);
      print("Berhasil menampilkan pelajaran");
      Flushbar(
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        title: "Berhasil menampilkan pelajaran",
        message: "Selamat belajar :)",
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      )..show(context);
      return data;
    } else {
      Flushbar(
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        message: "Gagal menampilkan pelajaran",
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      )..show(context);
      print("Gagal menampilkan pelajaran");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

Future singlePelajaran(String id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String userToken = prefs.getString('tokenauto');
  try {
    var url = "$base/pelajaran/${id}";
    var hasil = await http.get(
      url,
      headers: {"Authorization": "Bearer $userToken"},
    );
    if (hasil.statusCode == 200) {
      var data = json.decode(hasil.body);
      print("Berhasil menamiplkan bab");
      return data;
    } else {
      print("Gagal menampilkan bab");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

Future singleMateri(String id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String userToken = prefs.getString('tokenauto');
  try {
    var url = "$base/bab/${id}";
    var hasil = await http.get(
      url,
      headers: {"Authorization": "Bearer $userToken"},
    );
    if (hasil.statusCode == 200) {
      var data = json.decode(hasil.body);
      print("Berhasil menampikan materi");
      return data;
    } else {
      print("Gagal menampilkan materi");
      return null;
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
    // try {
    //   var url = "$base/user";
    //   var hasil = await http.get(
    //     url,
    //     headers: {"Authorization": "Bearer $userToken"},
    //   );
    //   if (hasil.statusCode == 200) {
    //     var data = json.decode(hasil.body.toString());
    //     print("Berhasil menampilkan user");
    //     return data;
    //   } else {
    //     print("Gagal menampilkan user");
    //     return null;
    //   }
    // } catch (e) {
    //   print("Error pada catch $e");
    // }
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
