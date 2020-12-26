part of 'models.dart';

List<BeginerAnswer> beginerAnswerFromJson(String str) =>
    List<BeginerAnswer>.from(
        json.decode(str).map((x) => BeginerAnswer.fromJson(x)));

String beginerAnswerToJson(List<BeginerAnswer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BeginerAnswer {
  BeginerAnswer({
    this.id,
    this.jawabanSalah1,
    this.jawabanSalah2,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String jawabanSalah1;
  String jawabanSalah2;
  DateTime createdAt;
  DateTime updatedAt;

  factory BeginerAnswer.fromJson(Map<String, dynamic> json) => BeginerAnswer(
        id: json["id"],
        jawabanSalah1: json["jawaban_salah_1"],
        jawabanSalah2: json["jawaban_salah_2"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jawaban_salah_1": jawabanSalah1,
        "jawaban_salah_2": jawabanSalah2,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
