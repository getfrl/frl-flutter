import 'package:flutter/widgets.dart';
import '../../resources/pages/trending_page.dart';
import '../../resources/pages/auth/login_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'controller.dart';
import '../models/user.dart';
import '../networking/auth_api_service.dart';

class AuthController extends Controller {
  AuthApiService _authApiService;

  AuthController(BuildContext context)
      : _authApiService = AuthApiService(buildContext: context) {
    super.construct(context);
  }

  Future<User?> signUp(String email, String password) async {
    User? user = await _authApiService.signUp(email, password);
    // User? user = User.fromJson(response);
    if (user != null) {
      // Handle successful sign up
      await Auth.login(user);

      routeTo(TrendingPage.path,
          navigationType: NavigationType.pushReplace,
          pageTransition: PageTransitionType.fade);
    } else {
      // Handle sign up error
      print('Signup was unsuccessful');
    }
    return user;
  }

  Future<User?> logIn(String email, String password) async {
    User? user = await _authApiService.logIn(email, password);
    if (user != null) {
      // Handle successful log in
      await Auth.login(user);
      // You might want to update some state here or navigate to a new page
      routeTo(TrendingPage.path,
          navigationType: NavigationType.pushReplace,
          pageTransition: PageTransitionType.fade);
    } else {
      // Handle log in error
      // You might want to show an error message here
      print('Login was unsuccessful');
    }
    return user;
  }

  Future<void> logOut(User user) async {
    await Auth.logout();

    // Make API call to backend to destroy session and remove notifcation token
    await _authApiService.logOut(user);

    routeTo(LoginPage.path,
        navigationType: NavigationType.pushReplace,
        pageTransition: PageTransitionType.fade);
  }
}
