import 'package:car_renatl_app/core/widgets/custom_button.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_bloc.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_event.dart';
import 'package:car_renatl_app/features/auth/presentation/widgets/logo_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  String _code = "";
  bool _onEditing = false;
  _onVerify() {
    if (_code != "") {
      BlocProvider.of<AuthBloc>(context).add(
        ActivateEvent(_code),
      );
      Navigator.of(context).pushNamed('/home');
    }
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
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                        "Enter 4 digit verification code. We just sent you on +25187854654",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                        "Enter code here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      child: VerificationCode(
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        keyboardType: TextInputType.number,
                        length: 4,
                        onCompleted: (String value) {
                          setState(() {
                            _code = value;
                          });
                        },
                        onEditing: (bool value) {
                          setState(() {
                            _onEditing = value;
                          });
                          if (!_onEditing) FocusScope.of(context).unfocus();
                        },
                        fullBorder: true,
                      ),
                    ),
                    CustomButton(
                      text: "Continue",
                      onPressed: _onVerify,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Container formTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: const Text(
        "Text",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
