part of 'viewModels.dart';

// Future getAllMateri(BuildContext context) async {
//   try {
//     http.Response hasil = await http.get(
//         Uri.encodeFull("https://data-beta.herokuapp.com/api/pelajaran"),
//         headers: {"Accept": "application/json"});

//     if (hasil.statusCode == 200) {
//       final snackbar = SnackBar(
//         duration: Duration(milliseconds: 3000),
//         backgroundColor: Colors.green,
//         content: Text("Berhasil memuat materi"),
//       );
//       Scaffold.of(context).showSnackBar(snackbar);
//       print("Berhasil memuat materi");
//       final data = dataPelajaranFromJson(hasil.body);
//       return data;
//     } else {
//       final snackbar = SnackBar(
//         duration: Duration(milliseconds: 3000),
//         backgroundColor: Colors.red,
//         content: Text("Gagal memuat materi"),
//       );
//       Scaffold.of(context).showSnackBar(snackbar);
//       print("Gagal memuat materi");
//       return null;
//     }
//   } catch (e) {
//     final snackbar = SnackBar(
//       duration: Duration(milliseconds: 3000),
//       backgroundColor: Colors.orange,
//       content: Text("Silahkan periksa internet anda"),
//     );
//     Scaffold.of(context).showSnackBar(snackbar);
//     print("Error pada catch $e");
//     return null;
//   }
// }

Future getSingleMateri(String id) async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://data-beta.herokuapp.com/api/pelajaran/${id}"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      // final snackbar = SnackBar(
      //   duration: Duration(milliseconds: 3000),
      //   backgroundColor: Colors.green,
      //   content: Text("Berhasil memuat materi"),
      // );
      // Scaffold.of(context).showSnackBar(snackbar);
      print("Berhasil memuat single materi");
      final data = dataPelajaranFromJson(hasil.body);
      return data;
    } else {
      // final snackbar = SnackBar(
      //   duration: Duration(milliseconds: 3000),
      //   backgroundColor: Colors.red,
      //   content: Text("Gagal memuat materi"),
      // );
      // Scaffold.of(context).showSnackBar(snackbar);
      print("Gagal memuat single materi");
      return null;
    }
  } catch (e) {
    // final snackbar = SnackBar(
    //   duration: Duration(milliseconds: 3000),
    //   backgroundColor: Colors.orange,
    //   content: Text("Silahkan periksa internet anda"),
    // );
    // Scaffold.of(context).showSnackBar(snackbar);
    print("Error pada catch $e");
    return null;
  }
}

Future deleteMateri(String id, BuildContext context) async {
  try {
    var url = "https://data-beta.herokuapp.com/api/pelajaran/${id}";
    var hasil = await http.delete(url);
    // http.Response hasil = await http.delete(
    //     Uri.encodeFull("https://data-beta.herokuapp.com/api/pelajaran/${id}"),
    //     headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.green,
        content: Text("Berhasil menghapus materi"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      print("Berhasil menghapus materi");
      final data = dataPelajaranFromJson(hasil.body);
      return data;
    } else {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.red,
        content: Text("Gagal menghapus materi"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      print("Gagal menghapus materi");
      return true;
    }
  } catch (e) {
    final snackbar = SnackBar(
      duration: Duration(milliseconds: 3000),
      backgroundColor: Colors.orange,
      content: Text("Silahkan periksa internet anda"),
    );
    Scaffold.of(context).showSnackBar(snackbar);
    print("Error pada catch $e");
    return false;
  }
}
