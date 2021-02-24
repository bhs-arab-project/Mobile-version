part of 'viewModels.dart';

Future getAllPelajaran(BuildContext context) async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("http://10.0.2.101:8000/api/pelajaran"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.green,
        content: Text("Berhasil memuat materi"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      print("Berhasil memuat materi");
      final data = dataPelajaranFromJson(hasil.body);
      return data;
    } else {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.red,
        content: Text("Gagal memuat materi"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      print("Gagal memuat materi");
      return null;
    }
  } catch (e) {
    final snackbar = SnackBar(
      duration: Duration(milliseconds: 3000),
      backgroundColor: Colors.orange,
      content: Text("Silahkan periksa internet anda"),
    );
    Scaffold.of(context).showSnackBar(snackbar);
    print("Error pada catch $e");
    return null;
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

// Future register(
//   BuildContext context,
//   String name,
//   String email,
//   String password,
//   String role,
// ) async {
//   try {
//     var url = "http://data-beta.herokuapp.com/api/register";
//     var hasil = await http.post(url,
//         body: ({
//           "name": name,
//           "email": email,
//           "password": password,
//           "role": role
//         }));
//     if (hasil.statusCode == 201) {
//       print("Berhasil register");
//       final snackbar = SnackBar(
//         duration: Duration(milliseconds: 3000),
//         backgroundColor: Colors.red,
//         content: Text("Berhasil Register"),
//       );
//       Scaffold.of(context).showSnackBar(snackbar);
//       return true;
//     } else {
//       print("Gagl register");
//       final snackbar = SnackBar(
//         duration: Duration(milliseconds: 3000),
//         backgroundColor: Colors.red,
//         content: Text("Gagal Register"),
//       );
//       Scaffold.of(context).showSnackBar(snackbar);
//       return false;
//     }
//   } catch (e) {
//     print('error pada $e');
//   }
// }
