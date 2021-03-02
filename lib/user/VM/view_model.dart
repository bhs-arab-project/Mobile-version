import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

Future allPelajaran() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String userToken = prefs.getString('tokenauto');
  try {
    var url = "https://base-data.herokuapp.com/api/pelajaran";
    var hasil = await http.get(
      url,
      headers: {"Authorization": "Bearer $userToken"},
    );
    if (hasil.statusCode == 200) {
      var data = json.decode(hasil.body);
      // print(data[0]['pelajaran']);
      return data;
    } else {
      print("Gagal menampikan data");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

Future singlePelajaran(String id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String userToken = prefs.getString('tokenauto');
  print(userToken);
  try {
    var url = "https://base-data.herokuapp.com/api/pelajaran/${id}";
    var hasil = await http.get(
      url,
      headers: {"Authorization": "Bearer $userToken"},
    );
    if (hasil.statusCode == 200) {
      var data = json.decode(hasil.body);
      // print(data[0]['pelajaran']);
      return data;
    } else {
      print("Gagal menampikan data");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

Future deleteMateri(String id) async {
  try {
    var url = "https://data-beta.herokuapp.com/api/pelajaran/${id}";
    var hasil = await http.delete(url);
    if (hasil.statusCode == 200) {
      print("Berhasil menghapus materi");
      return true;
    } else {
      print("Gagal menghapus materi");
      return true;
    }
  } catch (e) {
    print("Error pada catch $e");
    return false;
  }
}
