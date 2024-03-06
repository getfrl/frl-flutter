import 'package:flutter/material.dart';
import 'package:frl_flutter/app/controllers/auth_controller.dart';
import 'package:frl_flutter/resources/pages/auth/signup_page.dart';
import 'package:frl_flutter/resources/themes/text_theme/default_text_theme.dart';
import 'package:frl_flutter/resources/widgets/buttons/action_button.dart';
import 'package:frl_flutter/resources/widgets/buttons/social_login_button.dart';
import 'package:frl_flutter/resources/widgets/inputs/custom_text_field.dart';
import 'package:frl_flutter/resources/widgets/inputs/password_field.dart';
import 'package:frl_flutter/resources/widgets/utils/divider_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

// import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/login';

  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends NyState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AuthController _authController;

  @override
  init() async {
    super.init();
    _authController = AuthController(context);
  }

  void _logIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    await _authController.logIn(email, password);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 0, right: 16, bottom: 16, left: 16),
          // color: Color(0xFFEBE0D2), // Added background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this line
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text("Log in".tr(),
                          style: defaultTextTheme.displayLarge!.copyWith(
                            color: Colors.white,
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "👋 Welcome back",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                    CustomTextField(
                      controller: _emailController,
                      placeholder: "Your email address",
                    ),
                    SizedBox(height: 14),
                    PasswordField(controller: _passwordController),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: ActionButton(
                        onPressed: () {
                          _logIn();
                        },
                        text: 'Sign in',
                      ),
                    ),
                    SizedBox(height: 40),
                    DividerWidget(
                      text: "or",
                    ),
                    SizedBox(height: 40),
                    SocialLoginButton(
                      icon: Icons.facebook,
                      text: "Continue with Facebook",
                      backgroundColor: Color(0xFF435A9E),
                      onPressed: () {
                        // Handle Facebook login
                      },
                    ),
                    SizedBox(height: 14),
                    SocialLoginButton(
                      image: AssetImage('public/assets/images/google_logo.png'),
                      text: "Continue with Google",
                      backgroundColor: Colors.white,
                      color: Colors.black,
                      onPressed: () {
                        // Handle Apple login
                      },
                    ),
                    SizedBox(height: 14),
                    SocialLoginButton(
                      icon: Icons.apple,
                      text: "Continue with Apple",
                      backgroundColor: Colors.black,
                      onPressed: () {
                        // Handle Apple login
                      },
                    ),
                    SizedBox(height: 35),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  routeTo(SignupPage.path,
                      navigationType: NavigationType.pushReplace,
                      pageTransition: PageTransitionType.fade);
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account yet? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
