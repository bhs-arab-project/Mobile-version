part of "models.dart";

List<KosaKataBeginModel> kosaKataBeginModelFromJson(String str) => List<KosaKataBeginModel>.from(json.decode(str).map((x) => KosaKataBeginModel.fromJson(x)));

String kosaKataBeginModelToJson(List<KosaKataBeginModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KosaKataBeginModel {
    KosaKataBeginModel({
        this.id,
        this.arab,
        this.arabLatin,
        this.indo,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String arab;
    String arabLatin;
    String indo;
    DateTime createdAt;
    DateTime updatedAt;

    factory KosaKataBeginModel.fromJson(Map<String, dynamic> json) => KosaKataBeginModel(
        id: json["id"],
        arab: json["arab"],
        arabLatin: json["arab_latin"],
        indo: json["indo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "arab": arab,
        "arab_latin": arabLatin,
        "indo": indo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
