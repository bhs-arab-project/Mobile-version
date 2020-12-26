part of 'viewModels.dart';

Future getSoalAdvan() async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://db-arab.herokuapp.com/api/advance"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Sukses menampilkan soal Advance");
      final data = advanceModelFromJson(hasil.body);
      return data;
    } else {
      print("Gagal menampilkan soal Advance");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}