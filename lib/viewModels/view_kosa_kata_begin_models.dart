part of 'viewModels.dart';

Future getKosaKataBegin() async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://db-arab.herokuapp.com/api/kosakatabegin"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Sukses menampilkan kosa kata begin");
      final data = kosaKataBeginModelFromJson(hasil.body);
      return data;
    } else {
      print("Gagal menampilkan kosa kata begin");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

