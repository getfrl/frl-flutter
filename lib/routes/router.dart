import '../resources/pages/auth/signup_page.dart';
import '../resources/pages/auth/login_page.dart';
import '/resources/pages/profile_page.dart';
import '../resources/pages/trending_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.x/router
|--------------------------------------------------------------------------
*/

appRouter() => nyRoutes((router) {
      // Auth routes
      router.route(SignupPage.path, (context) => SignupPage(),
          initialRoute: true);
      router.route(LoginPage.path, (context) => LoginPage());

      // Main routes
      router.route(TrendingPage.path, (context) => TrendingPage(),
          authPage: true);

      // Profile & Settings routes
      router.route(ProfilePage.path, (context) => ProfilePage(),
          transition: PageTransitionType.fade);
    });
