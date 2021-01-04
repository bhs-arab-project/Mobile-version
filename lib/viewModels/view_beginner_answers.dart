part of 'viewModels.dart';

Future getAnswersBegin(BuildContext context) async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://db-arab.herokuapp.com/api/answerbegin"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Sukses menampilkan jawaban Beginer");
      final data = beginerAnswerFromJson(hasil.body);
      return data;
    } else {
      print("Gagal menampilkan jawaban Beginer");
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
