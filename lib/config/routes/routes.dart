import 'package:car_renatl_app/features/auth/presentation/pages/login_page.dart';
import 'package:car_renatl_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/register':
        return _materialRoute(const SignUpPage());
      default:
        return _materialRoute(const LoginPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
