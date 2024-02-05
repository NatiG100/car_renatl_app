import 'package:car_renatl_app/core/widgets/custom_text_field.dart';
import 'package:car_renatl_app/features/auth/presentation/widgets/logo_header.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoHeader(),
            formTitle(),
            const CustomTextField(
              hint: 'Email',
              prefix: 'assets/icons/email.svg',
            ),
            const CustomTextField(
              hint: 'Password',
              prefix: 'assets/icons/email.svg',
              isPassword: true,
            ),
            _loginOptions(context),
            ElevatedButton(
              onPressed: () {},
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
            )
          ],
        ),
      ),
    );
  }

  Container _loginOptions(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Row(
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
