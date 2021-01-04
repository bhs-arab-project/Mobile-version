part of 'viewModels.dart';

Future getSoalInter(BuildContext context) async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://db-arab.herokuapp.com/api/intermediate"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Sukses menampilkan soal Intermediate");
      final data = intermediateModelFromJson(hasil.body);
      return data;
    } else {
      print("Gagal menampilkan soal Intermediate");
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
