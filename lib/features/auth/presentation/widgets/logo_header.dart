import 'package:car_renatl_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(100),
      height: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 12,
              spreadRadius: 10,
              color: Colors.black.withAlpha(50))
        ],
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: SvgPicture.asset(
        'assets/icons/logo.svg',
        theme: svgTheme(),
      ),
    );
  }
}
