import 'package:car_renatl_app/config/theme/app_theme.dart';
import 'package:car_renatl_app/core/widgets/custom_button.dart';
import 'package:car_renatl_app/core/widgets/custom_text_field.dart';
import 'package:car_renatl_app/features/auth/domain/entities/user.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:car_renatl_app/features/auth/presentation/widgets/logo_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validation/form_validation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _formSubmittedOnce = false;

  bool _rememberMe = false;
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  // _onInputFieldChange(String value) {
  //   EasyDebounce.debounce(
  //     'save-sign-up-debouncer',
  //     const Duration(milliseconds: 500),
  //     _formKey.currentState!.save,
  //   );
  // }

  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

  _onLoginPressed() {
    setState(() {
      _formSubmittedOnce = true;
    });
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        LoginEvent(
          UserEntity(
            emailAddress: _emailC.text,
            password: _passwordC.text,
          ),
        ),
      );
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  _onRememberMeClicked(bool? value) {
    setState(() {
      _rememberMe = value ?? false;
    });
  }

  _navigateToRegisterPage() {
    Navigator.of(context).pushNamed('/register');
  }

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode get _autovalidateMode {
    return _formSubmittedOnce
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
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
                    _loginForm(context),
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

  Form _loginForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              hint: 'Email',
              prefix: 'assets/icons/email.svg',
              // text: _email,
              c: _emailC,
              validator: (String? value) {
                var validator = Validator(validators: [
                  const EmailValidator(),
                  const RequiredValidator(),
                ]);
                return validator.validate(label: 'Email', value: value);
              },
              autovalidateMode: _autovalidateMode,
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextField(
              hint: 'Password',
              prefix: 'assets/icons/password.svg',
              isPassword: true,
              // text: _password,
              c: _passwordC,
              validator: (String? value) {
                var validator = Validator(validators: [
                  const RequiredValidator(),
                  const MinLengthValidator(length: 6)
                ]);
                return validator.validate(label: 'Password', value: value);
              },
              autovalidateMode: _autovalidateMode,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: _loginOptions(context),
            ),
            CustomButton(
              text: "Login",
              onPressed: _onLoginPressed,
            ),
          ],
        ));
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
              TextButton(
                onPressed: _navigateToRegisterPage,
                child: const Text("Register now"),
              )
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
              value: _rememberMe,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              onChanged: _onRememberMeClicked,
              activeColor: Theme.of(context).primaryColor,
              side: BorderSide(
                  width: 1, color: Theme.of(context).unselectedWidgetColor),
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
