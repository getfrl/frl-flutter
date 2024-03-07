import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? id;
  String? frlId;
  String? username;
  String? gender;
  String? email;
  String? token;
  String? sessionId;

  User(
      {required this.id,
      this.username,
      this.gender,
      this.frlId,
      required this.email,
      required this.token,
      this.sessionId});

  User.fromJson(dynamic data) {
    this.id = data['id'];
    this.frlId = data['frl_id'];
    this.username = data['username'];
    this.gender = data['gender'];
    this.email = data['email'];
    this.token = data['token'];
    this.sessionId = data['session_id'];
  }

  toJson() => {
        "id": id,
        "frl_id": frlId,
        "email": email,
        "token": token,
        "username": username,
        "gender": gender,
        "session_id": sessionId
      };
}
