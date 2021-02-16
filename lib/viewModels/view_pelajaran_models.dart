part of 'viewModels.dart';

Future getAllPelajaran(BuildContext context) async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://data-beta.herokuapp.com/api/pelajaran"),
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

Future getSinglePelajaran(String id) async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://data-beta.herokuapp.com/api/pelajaran/${id}"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Berhasil memuat single materi");
      final data = json.decode(hasil.body);
      return data;
    } else {
      print("Gagal memuat single materi");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
    return null;
  }
}

Future getSingleBab(String id) async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://data-beta.herokuapp.com/api/bab/${id}"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Berhasil memuat single bab");
      final data = json.decode(hasil.body);
      return data;
    } else {
      print("Gagal memuat single bab");
      return null;
    }
  } catch (e) {
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
