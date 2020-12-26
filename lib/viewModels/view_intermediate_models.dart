part of 'viewModels.dart';

Future getSoalInter() async {
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
    showToast('Maaf data belum ada',
                                                  backgroundColor:
                                                      Colors.green[400],
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Avenir',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  animation:
                                                      StyledToastAnimation
                                                          .slideFromBottom,
                                                  reverseAnimation:
                                                      StyledToastAnimation
                                                          .slideToBottom,
                                                  startOffset: Offset(0.0, 3.0),
                                                  reverseEndOffset:
                                                      Offset(0.0, 3.0),
                                                  position: StyledToastPosition
                                                      .bottom,
                                                  duration:
                                                      Duration(seconds: 4),
                                                  //Animation duration   animDuration * 2 <= duration
                                                  animDuration:
                                                      Duration(seconds: 1),
                                                  curve: Curves.elasticOut,
                                                  reverseCurve:
                                                      Curves.fastOutSlowIn);
    print("Error pada catch $e");
  }
}
