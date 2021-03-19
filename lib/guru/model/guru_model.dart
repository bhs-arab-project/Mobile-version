import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.token,
    this.message,
    this.user,
  });

  Token token;
  String message;
  User user;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: Token.fromJson(json["token"]),
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token.toJson(),
        "message": message,
        "user": user.toJson(),
      };
}

class Token {
  Token({
    this.token,
    this.message,
  });

  String token;
  String message;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "message": message,
      };
}

class User {
  User({
    this.id,
    this.role,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String role;
  String name;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        role: json["role"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
