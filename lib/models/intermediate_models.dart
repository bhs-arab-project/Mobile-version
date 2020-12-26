part of "models.dart";

List<IntermediateModel> intermediateModelFromJson(String str) => List<IntermediateModel>.from(json.decode(str).map((x) => IntermediateModel.fromJson(x)));

String intermediateModelToJson(List<IntermediateModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IntermediateModel {
    IntermediateModel({
        this.id,
        this.soal,
        this.bahasaArab,
        this.bahasaIndo,
        this.value,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String soal;
    String bahasaArab;
    String bahasaIndo;
    bool value;
    DateTime createdAt;
    DateTime updatedAt;

    factory IntermediateModel.fromJson(Map<String, dynamic> json) => IntermediateModel(
        id: json["id"],
        soal: json["soal"],
        bahasaArab: json["bahasa_arab"],
        bahasaIndo: json["bahasa_indo"],
        value: json["value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "soal": soal,
        "bahasa_arab": bahasaArab,
        "bahasa_indo": bahasaIndo,
        "value": value,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
