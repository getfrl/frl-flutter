import 'dart:io';
import 'package:flutter/material.dart';
import '/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/models/user.dart';

class AuthApiService extends BaseApiService {
  AuthApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => 'https://safely-discrete-racer.ngrok-free.app';
  // String get baseUrl => getEnv('API_BASE_URL');

  Future<User?> signUp(String email, String password) async {
    return await network<User>(
      request: (request) => request.post("/api/v1/users", data: {
        "user": {
          "email": email,
          "password": password,
        }
      }),
    );
  }

  Future<User?> logIn(String email, String password) async {
    return await network<User>(
      request: (request) => request
          .post("/api/v1/auth", data: {"email": email, "password": password}),
    );
  }

  Future<User?> logOut(User user) async {
    return await network<User>(
        request: (request) => request.delete(
              "/api/v1/auth",
              options: Options(
                headers: {
                  HttpHeaders.authorizationHeader: 'Bearer ${user.token}',
                },
              ),
              data: {"session_id": user.sessionId},
            ));
  }
}
