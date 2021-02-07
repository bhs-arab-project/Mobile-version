part of 'viewModels.dart';

Future getMateri(BuildContext context) async {
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
      content: Text("Silahkan periksa interner anda"),
    );
    Scaffold.of(context).showSnackBar(snackbar);
    print("Error pada catch $e");
    return null;
  }
}
