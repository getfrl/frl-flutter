import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/models/user.dart';
import '/config/decoders.dart';

class MeApiService extends NyApiService {
  MeApiService({BuildContext? buildContext})
      : super(
          buildContext,
          decoders: modelDecoders,
          // baseOptions: (BaseOptions baseOptions) {
          //   return baseOptions
          //             ..connectTimeout = Duration(seconds: 5)
          //             ..sendTimeout = Duration(seconds: 5)
          //             ..receiveTimeout = Duration(seconds: 5);
          // },
        );

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<User> fetchMe(User user) async {
    debugPrint("Model Decoders Keys: ${decoders.containsKey(User)}");
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
