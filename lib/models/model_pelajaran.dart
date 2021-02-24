part of 'models.dart';

List<DataPelajaran> dataPelajaranFromJson(String str) =>
    List<DataPelajaran>.from(
        json.decode(str).map((x) => DataPelajaran.fromJson(x)));

String dataPelajaranToJson(List<DataPelajaran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataPelajaran {
  DataPelajaran({
    this.id,
    this.userId,
    this.pelajaran,
    this.tingkatan,
    this.deskripsi,
    this.createdAt,
    this.updatedAt,
    this.chapter,
  });

  int id;
  int userId;
  String pelajaran;
  String tingkatan;
  String deskripsi;
  DateTime createdAt;
  DateTime updatedAt;
  List<Chapter> chapter;

  factory DataPelajaran.fromJson(Map<String, dynamic> json) => DataPelajaran(
        id: json["id"],
        userId: json["user_id"],
        pelajaran: json["pelajaran"],
        tingkatan: json["tingkatan"],
        deskripsi: json["deskripsi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        chapter:
            List<Chapter>.from(json["chapter"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "pelajaran": pelajaran,
        "tingkatan": tingkatan,
        "deskripsi": deskripsi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "chapter": List<dynamic>.from(chapter.map((x) => x.toJson())),
      };
}

class Chapter {
  Chapter({
    this.id,
    this.userId,
    this.lessonId,
    this.judulBab,
    this.materi,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  int lessonId;
  String judulBab;
  String materi;
  DateTime createdAt;
  DateTime updatedAt;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        userId: json["user_id"],
        lessonId: json["lesson_id"],
        judulBab: json["judul_bab"],
        materi: json["materi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "lesson_id": lessonId,
        "judul_bab": judulBab,
        "materi": materi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
