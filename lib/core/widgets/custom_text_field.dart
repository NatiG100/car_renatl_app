import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.prefix,
    this.suffix,
    this.isPassword = false,
  });
  final String? hint;
  final String? prefix;
  final Widget? suffix;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black.withAlpha(20),
          )
        ],
      ),
      child: TextField(
        style: const TextStyle(fontSize: 20),
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black.withAlpha(80)),
          border: InputBorder.none,
          prefix: Container(
            height: 15,
            width: 18,
            margin: const EdgeInsets.only(left: 10, right: 15),
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
