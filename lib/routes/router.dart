import '/resources/pages/explore_page.dart';
import '/resources/pages/notifications_page.dart';
import '/resources/pages/onboarding/buy_page.dart';
import '/resources/pages/onboarding/recommendations_page.dart';
import '../resources/pages/onboarding/trend_page.dart';
import '/resources/pages/onboarding/allow_notifications_page.dart';
import '/resources/pages/onboarding/profile_page.dart';
import '../resources/pages/product_page.dart';
import '../resources/pages/auth/signup_page.dart';
import '../resources/pages/auth/login_page.dart';
import '../resources/pages/me_page.dart';
import '../resources/pages/trending_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* App Router
|--------------------------------------------------------------------------
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.20.0/router
|-------------------------------------------------------------------------- */

appRouter() => nyRoutes((router) {
      // Auth routes
      router.route(SignupPage.path, (context) => SignupPage());
      router.route(LoginPage.path, (context) => LoginPage(),
          initialRoute: true);

      // Main routes
      router.route(TrendingPage.path, (context) => TrendingPage(),
          authPage: true);

      // Product routes
      router.route(ProductPage.path, (context) => ProductPage());

      // Profile & Settings routes
      router.route(MePage.path, (context) => MePage(),
          transition: PageTransitionType.fade);

      // Onbording routes
      router.route(ProfilePage.path, (context) => ProfilePage());
      router.route(
          AllowNotificationsPage.path, (context) => AllowNotificationsPage());
      router.route(TrendPage.path, (context) => TrendPage());
      router.route(
          RecommendationsPage.path, (context) => RecommendationsPage());
      router.route(BuyPage.path, (context) => BuyPage());
      router.route(NotificationsPage.path, (context) => NotificationsPage());
      router.route(ExplorePage.path, (context) => ExplorePage());
    });
