import 'package:nylo_framework/nylo_framework.dart';
import 'controller.dart';
import 'package:flutter/widgets.dart';
import '../models/user.dart';
import '../networking/me_api_service.dart';

class MeController extends Controller {
  MeApiService _meApiService;

  MeController(BuildContext context)
      : _meApiService = MeApiService(buildContext: context) {
    super.construct(context);
  }

  Future<User?> fetchMe() async {
    User me = await _meApiService.fetchMe(Auth.user());
    return me;
  }
}
