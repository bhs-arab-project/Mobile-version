part of 'models.dart';

List<BeginnerModel> beginnerModelFromJson(String str) =>
    List<BeginnerModel>.from(
        json.decode(str).map((x) => BeginnerModel.fromJson(x)));

String beginnerModelToJson(List<BeginnerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BeginnerModel {
  BeginnerModel({
    this.id,
    this.no,
    this.soal,
    this.jwbArab,
    this.jwbSalah1,
    this.jwbSalah2,
    this.gambar,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String no;
  String soal;
  String jwbArab;
  String jwbSalah1;
  String jwbSalah2;
  String gambar;
  DateTime createdAt;
  DateTime updatedAt;

  factory BeginnerModel.fromJson(Map<String, dynamic> json) => BeginnerModel(
        id: json["id"],
        no: json["no"],
        soal: json["soal"],
        jwbArab: json["jwb_arab"],
        jwbSalah1: json["jwb_salah_1"],
        jwbSalah2: json["jwb_salah_2"],
        gambar: json["gambar"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        "soal": soal,
        "jwb_arab": jwbArab,
        "jwb_salah_1": jwbSalah1,
        "jwb_salah_2": jwbSalah2,
        "gambar": gambar,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
