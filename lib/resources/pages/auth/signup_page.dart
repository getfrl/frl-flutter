import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nylo_framework/nylo_framework.dart';

// Pages
import 'package:flutter_app/resources/pages/auth/login_page.dart';

// controllers
import '/app/controllers/controller.dart';
import '/app/controllers/auth_controller.dart';

// Components / Reusable widgets
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/inputs/password_field.dart';
import 'package:flutter_app/resources/widgets/buttons/social_login_button.dart';
import 'package:flutter_app/resources/widgets/buttons/action_button.dart';
import 'package:flutter_app/resources/widgets/utils/divider_widget.dart';

class SignupPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/signup';

  SignupPage({Key? key}) : super(key: key);

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
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Frl".tr(),
                        style: defaultTextTheme.displayLarge,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "To access your tennis iD you will need an account. Please create one below.",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    // SupaSocialsAuth(
                    //   socialProviders: [
                    //     SocialProviders.apple,
                    //     SocialProviders.facebook,
                    //   ],
                    //   colored: true,
                    //   redirectUrl: 'io.mydomain.myapp://callback',
                    //   onSuccess: (Session response) {},
                    //   onError: (error) {},
                    // ),
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
                      icon: Icons.apple,
                      text: "Continue with Apple",
                      backgroundColor: Colors.black,
                      onPressed: () {
                        // Handle Apple login
                      },
                    ),
                    SizedBox(height: 35),
                    DividerWidget(
                      text: "or sign-up with your email address",
                    ),
                    SizedBox(height: 35),
                    CupertinoTextField(
                      controller: _emailController,
                      style: TextStyle(color: Color(0xFF231F20), fontSize: 16),
                      placeholder: "Your email address",
                      placeholderStyle:
                          TextStyle(fontSize: 14, color: Color(0xFF959A9A)),
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF959A9A),
                        ),
                      ),
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
                        text: 'Register now',
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  routeTo(LoginPage.path,
                      navigationType: NavigationType.pushReplace,
                      pageTransition: PageTransitionType.fade);
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
