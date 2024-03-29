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
import 'package:form_validation/form_validation.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _agree = false;
  bool _formSubmittedOnce = false;
  bool agreed = false;
  final TextEditingController _fullNameC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _mobileNumberC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  final TextEditingController _confirmPasswordC = TextEditingController();

  @override
  @override
  void initState() {
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
    setState(() {
      _formSubmittedOnce = true;
    });
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        UserRegisterEvent(
          UserEntity(
            fullName: _fullNameC.text,
            emailAddress: _emailC.text,
            mobileNumber: _mobileNumberC.text,
            password: _passwordC.text,
            confirmPassword: _confirmPasswordC.text,
          ),
        ),
      );
    }
  }

  _onCheckboxClick(bool? value) {
    setState(() {
      _agree = value ?? false;
    });
  }

  _navigateToSignInPage() {
    Navigator.of(context).pushNamed('/login');
  }

  AutovalidateMode get _autovalidateMode {
    return _formSubmittedOnce
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    _signupForm(context),
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

  Form _signupForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hint: 'Full Name',
            prefix: 'assets/icons/user.svg',
            c: _fullNameC,
            validator: (String? value) {
              Validator validator = Validator(validators: [
                const RequiredValidator(),
              ]);
              return validator.validate(label: 'Full Name', value: value);
            },
            autovalidateMode: _autovalidateMode,
          ),
          CustomTextField(
            hint: 'Email',
            prefix: 'assets/icons/email.svg',
            c: _emailC,
            validator: (String? value) {
              Validator validator = Validator(validators: [
                const RequiredValidator(),
                const EmailValidator(),
              ]);
              return validator.validate(label: 'email', value: value);
            },
            autovalidateMode: _autovalidateMode,
            textInputType: TextInputType.emailAddress,
          ),
          CustomTextField(
            hint: 'Mobile Number',
            prefix: 'assets/icons/phone.svg',
            c: _mobileNumberC,
            validator: (String? value) {
              Validator validator = Validator(validators: [
                const RequiredValidator(),
                const PhoneNumberValidator(),
              ]);
              return validator.validate(label: 'Mobile Number', value: value);
            },
            autovalidateMode: _autovalidateMode,
            textInputType: TextInputType.phone,
          ),
          CustomTextField(
            hint: 'Password',
            prefix: 'assets/icons/password.svg',
            isPassword: true,
            c: _passwordC,
            validator: (String? value) {
              Validator validator = Validator(validators: [
                const RequiredValidator(),
                const MinLengthValidator(length: 6)
              ]);
              return validator.validate(label: 'Password', value: value);
            },
            autovalidateMode: _autovalidateMode,
          ),
          CustomTextField(
            hint: 'Confirm Password',
            prefix: 'assets/icons/password.svg',
            isPassword: true,
            c: _confirmPasswordC,
            validator: (String? value) {
              if (value != _passwordC.text) {
                return "Passwords don't match";
              }
              return null;
            },
            autovalidateMode: _autovalidateMode,
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: _legalNoticeSection(context),
          ),
          CustomButton(
            text: "Register",
            onPressed: _onRegisterPressed,
            disabled: !_agree,
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

  Row _legalNoticeSection(BuildContext context) {
    TextStyle defaultStyle = const TextStyle(color: Colors.black);
    TextStyle linkStyle = TextStyle(color: Theme.of(context).primaryColor);
    return Row(
      children: [
        Checkbox(
          value: _agree,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          onChanged: _onCheckboxClick,
          activeColor: Theme.of(context).primaryColor,
          side: BorderSide(
              width: 1, color: Theme.of(context).unselectedWidgetColor),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: RichText(
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
          ),
        ),
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
