import 'package:car_renatl_app/config/theme/app_theme.dart';
import 'package:car_renatl_app/core/widgets/custom_button.dart';
import 'package:car_renatl_app/core/widgets/custom_text_field.dart';
import 'package:car_renatl_app/features/auth/domain/entities/user.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_event.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_bloc.dart';
import 'package:car_renatl_app/features/auth/presentation/widgets/logo_header.dart';
import 'package:flutter/gestures.dart';
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
  bool agreed = false;
  final TextEditingController _fullNameC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _mobileNumberC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  final TextEditingController _confirmPasswordC = TextEditingController();
  _onPasswordChange() {
    setState(() {
      _password = _passwordC.text;
    });
  }

  _onEmailChange() {
    setState(() {
      _email = _emailC.text;
    });
  }

  _onFullNameChange() {
    setState(() {
      _fullName = _fullNameC.text;
    });
  }

  _onMobileNumberChange() {
    setState(() {
      _mobileNumber = _mobileNumberC.text;
    });
  }

  _onConFirmPasswordChange() {
    setState(() {
      _confirmPassword = _confirmPasswordC.text;
    });
  }

  @override
  @override
  void initState() {
    _fullNameC.addListener(_onFullNameChange);
    _emailC.addListener(_onEmailChange);
    _mobileNumberC.addListener(_onMobileNumberChange);
    _passwordC.addListener(_onPasswordChange);
    _confirmPasswordC.addListener(_onConFirmPasswordChange);

    super.initState();
  }

  @override
  void dispose() {
    _fullNameC.dispose();
    _emailC.dispose();
    _mobileNumberC.dispose();
    _passwordC.dispose();
    _confirmPasswordC.dispose();

    super.dispose();
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
  }

  _navigateToSignInPage() {
    Navigator.of(context).pushNamed('/login');
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
                      prefix: 'assets/icons/user.svg',
                      text: _fullName,
                      c: _fullNameC,
                    ),
                    CustomTextField(
                      hint: 'Email',
                      prefix: 'assets/icons/email.svg',
                      text: _email,
                      c: _emailC,
                    ),
                    CustomTextField(
                      hint: 'Mobile Number',
                      prefix: 'assets/icons/phone.svg',
                      text: _mobileNumber,
                      c: _mobileNumberC,
                    ),
                    CustomTextField(
                      hint: 'Password',
                      prefix: 'assets/icons/password.svg',
                      isPassword: true,
                      text: _password,
                      c: _passwordC,
                    ),
                    CustomTextField(
                      hint: 'Confirm Password',
                      prefix: 'assets/icons/password.svg',
                      text: _confirmPassword,
                      c: _confirmPasswordC,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      child: _legalNoticeSection(context),
                    ),
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
              const Text("Already have an account? "),
              TextButton(
                onPressed: _navigateToSignInPage,
                child: const Text("Sign in"),
              )
            ],
          )
        ],
      ),
    );
  }

  RichText _legalNoticeSection(BuildContext context) {
    TextStyle defaultStyle = const TextStyle(color: Colors.black);
    TextStyle linkStyle = TextStyle(color: Theme.of(context).primaryColor);
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          const TextSpan(text: 'By creating account you agree to our '),
          TextSpan(
            text: "terms & conditions ",
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(text: "and "),
          TextSpan(
            text: "privacy policy",
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = () {},
          )
        ],
      ),
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
