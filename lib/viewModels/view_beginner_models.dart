part of 'viewModels.dart';

Future getSoalBegin() async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://db-arab.herokuapp.com/api/begin"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Sukses menampilkan soal Beginer");
      final data = beginnerModelFromJson(hasil.body);
      return data;
    } else {
      print("Gagal menampilkan soal Beginer");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}
