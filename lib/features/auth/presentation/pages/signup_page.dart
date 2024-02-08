import 'package:car_renatl_app/config/theme/app_theme.dart';
import 'package:car_renatl_app/core/widgets/custom_button.dart';
import 'package:car_renatl_app/core/widgets/custom_text_field.dart';
import 'package:car_renatl_app/features/auth/domain/entities/user.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_article_event.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_bloc.dart';
import 'package:car_renatl_app/features/auth/presentation/widgets/logo_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email = "";
  String _fullName = "";
  String _mobileNumber = "";
  String _password = "";
  String _confirmPassword = "";
  bool rememberMe = false;
  _onPasswordChange(String value) {
    _password = value;
  }

  _onEmailChange(String value) {
    _email = _email;
  }

  _onFullNameChange(String value) {
    _fullName = _email;
  }

  _onMobileNumberChange(String value) {
    _mobileNumber = _email;
  }

  _onConFirmPasswordChange(String value) {
    _confirmPassword = _email;
  }

  _onRegisterPressed() {
    BlocProvider.of<AuthBloc>(context).add(
      UserRegisterEvent(
        UserEntity(
          fullName: _fullName,
          emailAddress: _email,
          mobileNumber: _mobileNumber,
          password: _password,
          confirmPassword: _confirmPassword,
        ),
      ),
    );
    print("logging in");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              const CustomAppBar(),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    formTitle(),
                    CustomTextField(
                      hint: 'Full Name',
                      prefix: 'assets/icons/email.svg',
                      text: _fullName,
                      onChange: _onFullNameChange,
                    ),
                    CustomTextField(
                      hint: 'Email',
                      prefix: 'assets/icons/email.svg',
                      text: _email,
                      onChange: _onEmailChange,
                    ),
                    CustomTextField(
                      hint: 'Mobile Number',
                      prefix: 'assets/icons/email.svg',
                      text: _mobileNumber,
                      onChange: _onMobileNumberChange,
                    ),
                    CustomTextField(
                      hint: 'Password',
                      prefix: 'assets/icons/password.svg',
                      isPassword: true,
                      text: _password,
                      onChange: _onPasswordChange,
                    ),
                    CustomTextField(
                      hint: 'Confirm Password',
                      prefix: 'assets/icons/email.svg',
                      text: _confirmPassword,
                      onChange: _onConFirmPasswordChange,
                    ),
                    _loginOptions(context),
                    CustomButton(
                      text: "Register",
                      onPressed: _onRegisterPressed,
                    ),
                    _loginBottomArea(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Container _loginBottomArea() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: Divider()),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: const Text(
                    "or",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
          ),
          const Text("Continue via your social"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/google.svg',
                  theme: svgTheme(),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/facebook.svg',
                  theme: svgTheme(),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account? "),
              TextButton(onPressed: () {}, child: const Text("Register now"))
            ],
          )
        ],
      ),
    );
  }

  Row _loginOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: true,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              onChanged: (bool? x) {},
              activeColor: Theme.of(context).primaryColor,
            ),
            Text(
              "Remember Me",
              style: TextStyle(color: Colors.black.withAlpha(180)),
            )
          ],
        ),
        const Text(
          "Forgot password?",
          style: TextStyle(color: Colors.deepOrangeAccent),
        )
      ],
    );
  }

  Container formTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: const Text(
        "Login",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
