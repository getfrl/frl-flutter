import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? id;
  String? frlId;
  String? username;
  String? gender;
  String? email;
  String? token;
  String? sessionId;

  User({
    required this.id,
    this.username,
    this.gender,
    this.frlId,
    required this.email,
    required this.token,
    this.sessionId,
  });

  User.fromJson(dynamic data) {
    id = data['id'];
    frlId = data['frl_id'];
    username = data['username'];
    gender = data['gender'];
    email = data['email'];
    token = data['token'];
    sessionId = data['session_id'];
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "frl_id": frlId,
        "email": email,
        "token": token,
        "username": username,
        "gender": gender,
        "session_id": sessionId,
      };
}
