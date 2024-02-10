import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.prefix,
    this.suffix,
    this.isPassword = false,
    this.text = "",
    required this.c,
    this.validator,
    this.autovalidateMode,
    this.textInputType,
  });
  final String? hint;
  final String? prefix;
  final Widget? suffix;
  final bool isPassword;
  final String text;
  final TextEditingController c;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        keyboardType: textInputType,
        autovalidateMode: autovalidateMode,
        validator: validator,
        style: const TextStyle(fontSize: 16),
        obscureText: isPassword,
        controller: c,
        decoration: InputDecoration(
          fillColor: Theme.of(context).cardColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).hintColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black.withAlpha(80)),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 20,
            maxWidth: 40,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: prefix != null
                ? SvgPicture.asset(
                    prefix!,
                    theme: SvgTheme(
                      currentColor: Theme.of(context).primaryColor,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
