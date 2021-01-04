part of 'viewModels.dart';

Future getKosaKataBegin(BuildContext context) async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://db-arab.herokuapp.com/api/kosakatabegin"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Sukses menampilkan kosa kata begin");
      final data = kosaKataBeginModelFromJson(hasil.body);
      final tampil = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.blueAccent,
        content: Text("Data berhasil di tampilkan")
      );
      Scaffold.of(context).showSnackBar(tampil);
      return data;
    } else {
      print("Gagal menampilkan kosa kata begin");
      return null;
    }
  } catch (e) {
    final snackbar = SnackBar(
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.blue,
      content: Text("Maaf data belum tersedia"),
    );
    Scaffold.of(context).showSnackBar(snackbar);
    print("Error pada catch $e");
  }
}
