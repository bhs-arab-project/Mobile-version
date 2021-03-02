// To parse this JSON data, do
//
//     final pelajaran = pelajaranFromJson(jsonString);

import 'dart:convert';

List<Pelajaran> pelajaranFromJson(String str) =>
    List<Pelajaran>.from(json.decode(str).map((x) => Pelajaran.fromJson(x)));

String pelajaranToJson(List<Pelajaran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pelajaran {
  Pelajaran({
    this.id,
    this.userId,
    this.pelajaran,
    this.guru,
    this.tingkatan,
    this.deskripsi,
    this.createdAt,
    this.updatedAt,
    this.chapter,
    this.quiz,
  });

  int id;
  int userId;
  String pelajaran;
  String guru;
  String tingkatan;
  String deskripsi;
  DateTime createdAt;
  DateTime updatedAt;
  List<Chapter> chapter;
  List<Quiz> quiz;

  factory Pelajaran.fromJson(Map<String, dynamic> json) => Pelajaran(
        id: json["id"],
        userId: json["user_id"],
        pelajaran: json["pelajaran"],
        guru: json["guru"],
        tingkatan: json["tingkatan"],
        deskripsi: json["deskripsi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        chapter:
            List<Chapter>.from(json["chapter"].map((x) => Chapter.fromJson(x))),
        quiz: List<Quiz>.from(json["quiz"].map((x) => Quiz.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "pelajaran": pelajaran,
        "guru": guru,
        "tingkatan": tingkatan,
        "deskripsi": deskripsi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "chapter": List<dynamic>.from(chapter.map((x) => x.toJson())),
        "quiz": List<dynamic>.from(quiz.map((x) => x.toJson())),
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

class Quiz {
  Quiz({
    this.id,
    this.lessonId,
    this.questionText,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int lessonId;
  String questionText;
  DateTime createdAt;
  DateTime updatedAt;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json["id"],
        lessonId: json["lesson_id"],
        questionText: json["question_text"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lesson_id": lessonId,
        "question_text": questionText,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
