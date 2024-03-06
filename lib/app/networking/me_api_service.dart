import 'dart:io';
import 'package:flutter/material.dart';
import '/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/models/user.dart';

class MeApiService extends BaseApiService {
  MeApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  // String get baseUrl => 'https://safely-discrete-racer.ngrok-free.app';
  String get baseUrl => getEnv('API_BASE_URL');

  Future<User> fetchMe(User user) async {
    User? result = await network<User>(
      request: (request) => request.get(
        "/api/v1/me",
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.token}',
          },
        ),
      ),
    );

    if (result == null) {
      throw Exception('User not found');
    }

    return result;
  }
}
