import 'package:flutter/material.dart';
import 'package:frl_flutter/resources/widgets/inputs/custom_text_field.dart';
import 'package:nylo_framework/nylo_framework.dart';

// Pages
import 'package:frl_flutter/resources/pages/auth/login_page.dart';

// controllers
import '/app/controllers/controller.dart';
import '/app/controllers/auth_controller.dart';

// Components / Reusable widgets
import 'package:frl_flutter/resources/themes/text_theme/default_text_theme.dart';
import 'package:frl_flutter/resources/widgets/inputs/password_field.dart';
import 'package:frl_flutter/resources/widgets/buttons/social_login_button.dart';
import 'package:frl_flutter/resources/widgets/buttons/action_button.dart';
import 'package:frl_flutter/resources/widgets/utils/divider_widget.dart';

class SignupPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/signup';

  SignupPage({Key? key}) : super(path, child: _SignupPageState());

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends NyState<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AuthController _authController;

  @override
  init() async {
    super.init();
    _authController = AuthController(context);
  }

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    await _authController.signUp(email, password);
  }

  @override
  void dispose() {
    _passwordController.dispose();
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
                      child: Text("Register".tr(),
                          style: defaultTextTheme.displayLarge!.copyWith(
                            color: Colors.white,
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Yo, Get For Real already",
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
                          _signUp();
                        },
                        text: 'Create account',
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
                  routeTo(
                    LoginPage.path,
                    navigationType: NavigationType.pushReplace,
                    pageTransition: PageTransitionType.fade,
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Log in',
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
