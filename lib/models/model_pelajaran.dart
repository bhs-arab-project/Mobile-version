part of 'models.dart';

List<DataPelajaran> dataPelajaranFromJson(String str) =>
    List<DataPelajaran>.from(
        json.decode(str).map((x) => DataPelajaran.fromJson(x)));

String dataPelajaranToJson(List<DataPelajaran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataPelajaran {
  DataPelajaran({
    this.id,
    this.guruId,
    this.pelajaran,
    this.guru,
    this.tingkatan,
    this.jumlahMateri,
    this.deskripsi,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int guruId;
  String pelajaran;
  String guru;
  String tingkatan;
  String jumlahMateri;
  String deskripsi;
  DateTime createdAt;
  DateTime updatedAt;

  factory DataPelajaran.fromJson(Map<String, dynamic> json) => DataPelajaran(
        id: json["id"],
        guruId: json["guru_id"],
        pelajaran: json["pelajaran"],
        guru: json["guru"],
        tingkatan: json["tingkatan"],
        jumlahMateri: json["jumlah_materi"],
        deskripsi: json["deskripsi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guru_id": guruId,
        "pelajaran": pelajaran,
        "guru": guru,
        "tingkatan": tingkatan,
        "jumlah_materi": jumlahMateri,
        "deskripsi": deskripsi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
