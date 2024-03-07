import '/app/models/vote.dart';
import '/app/models/product.dart';
import '/app/networking/me_api_service.dart';
import '/app/networking/auth_api_service.dart';
import '/app/models/user.dart';
import '/app/networking/api_service.dart';

/* Model Decoders
|--------------------------------------------------------------------------
| Model decoders are used in 'app/networking/' for morphing json payloads
| into Models.
|
| Learn more https://nylo.dev/docs/5.20.0/decoders#model-decoders
|-------------------------------------------------------------------------- */

final Map<Type, dynamic> modelDecoders = {
  List<User>: (data) =>
      List.from(data).map((json) => User.fromJson(json)).toList(),
  User: (data) => User.fromJson(data),
  List<Product>: (data) =>
      List.from(data).map((json) => Product.fromJson(json)).toList(),
  Product: (data) => Product.fromJson(data),
  List<Vote>: (data) =>
      List.from(data).map((json) => Vote.fromJson(json)).toList(),
  Vote: (data) => Vote.fromJson(data),
};

/* API Decoders
| -------------------------------------------------------------------------
| API decoders are used when you need to access an API service using the
| 'api' helper. E.g. api<MyApiService>((request) => request.fetchData());
|
| Learn more https://nylo.dev/docs/5.20.0/decoders#api-decoders
|-------------------------------------------------------------------------- */

final Map<Type, dynamic> apiDecoders = {
  ApiService: () => ApiService(),

  // ...

  AuthApiService: () => AuthApiService(),
  MeApiService: () => MeApiService(),
};

/* Controller Decoders
| -------------------------------------------------------------------------
| Controller are used in pages.
|
| Learn more https://nylo.dev/docs/5.20.0/controllers
|-------------------------------------------------------------------------- */
final Map<Type, dynamic> controllers = {
  // HomeController: () => HomeController(),

  // ...
};
