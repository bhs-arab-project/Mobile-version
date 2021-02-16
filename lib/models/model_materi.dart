part of 'models.dart';

List<DataMateri> dataMateriFromJson(String str) =>
    List<DataMateri>.from(json.decode(str).map((x) => DataMateri.fromJson(x)));

String dataMateriToJson(List<DataMateri> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataMateri {
  DataMateri({
    this.id,
    this.lessonId,
    this.judulBab,
    this.createdAt,
    this.updatedAt,
    this.theory,
  });

  int id;
  int lessonId;
  String judulBab;
  DateTime createdAt;
  DateTime updatedAt;
  Theory theory;

  factory DataMateri.fromJson(Map<String, dynamic> json) => DataMateri(
        id: json["id"],
        lessonId: json["lesson_id"],
        judulBab: json["judul_bab"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        theory: Theory.fromJson(json["theory"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lesson_id": lessonId,
        "judul_bab": judulBab,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "theory": theory.toJson(),
      };
}

class Theory {
  Theory({
    this.id,
    this.chapterId,
    this.materi,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int chapterId;
  String materi;
  DateTime createdAt;
  DateTime updatedAt;

  factory Theory.fromJson(Map<String, dynamic> json) => Theory(
        id: json["id"],
        chapterId: json["chapter_id"],
        materi: json["materi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chapter_id": chapterId,
        "materi": materi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
