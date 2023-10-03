import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? id;
  String? name;
  String? email;
  String? token;
  String? sessionId;

  User(
      {required this.id,
      this.name,
      required this.email,
      required this.token,
      this.sessionId});

  User.fromJson(dynamic data) {
    this.id = data['id'];
    this.name = data['name'];
    this.email = data['email'];
    this.token = data['token'];
    this.sessionId = data['session_id'];
  }

  toJson() => {
        "id": id,
        "email": email,
        "token": token,
        "name": name,
        "session_id": sessionId
      };
}
