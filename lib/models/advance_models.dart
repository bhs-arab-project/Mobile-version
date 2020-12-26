part of 'models.dart';

List<AdvanceModel> advanceModelFromJson(String str) => List<AdvanceModel>.from(json.decode(str).map((x) => AdvanceModel.fromJson(x)));

String advanceModelToJson(List<AdvanceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvanceModel {
    AdvanceModel({
        this.id,
        this.soal,
        this.bahasaArab,
        this.jawaban,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String soal;
    String bahasaArab;
    dynamic jawaban;
    DateTime createdAt;
    DateTime updatedAt;

    factory AdvanceModel.fromJson(Map<String, dynamic> json) => AdvanceModel(
        id: json["id"],
        soal: json["soal"],
        bahasaArab: json["bahasa_arab"],
        jawaban: json["jawaban"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "soal": soal,
        "bahasa_arab": bahasaArab,
        "jawaban": jawaban,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
