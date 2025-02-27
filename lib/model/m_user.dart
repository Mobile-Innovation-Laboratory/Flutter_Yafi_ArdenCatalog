import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class M_User {
  String id;
  String username;
  String email;
  String password;
  int status;
  String token;

  M_User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.status,
    required this.token
  });

  factory M_User.fromJson(String str) =>
      M_User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory M_User.fromMap(Map<String, dynamic> json) => M_User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        token: json["token"]
      );

  factory M_User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return M_User(
      id: doc.id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      status: data['status'] ?? '',
      token: data['token'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "status" : status,
        "token" : token,
      };
}
