import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_bloc.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_state.dart';
import 'package:car_renatl_app/features/auth/presentation/pages/login_page.dart';
import 'package:car_renatl_app/features/auth/presentation/pages/profile_page.dart';
import 'package:car_renatl_app/features/auth/presentation/pages/signup_page.dart';
import 'package:car_renatl_app/features/auth/presentation/pages/verify_page.dart';
import 'package:car_renatl_app/features/car_booking/presentation/pages/start_booking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  AppRoutes({required this.context});
  BuildContext context;
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/register':
        return _materialRoute(_authRender(context, const SignUpPage()));
      case '/profile':
        return _materialRoute(_authRender(context, const ProfilePage()));
      case '/home':
        return _materialRoute(_authRender(context, const StartBookingPage()));
      default:
        return _materialRoute(_authRender(context, const LoginPage()));
    }
  }

  Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  Widget _authRender(BuildContext context, Widget page) {
    return BlocBuilder<AuthBloc, RemoteAuthState>(
      builder: (_, state) {
        if (state is RemoteAuthError) {
          return const Text("Error");
        }
        if (state is RemoteAuthInactive) {
          return const VerifyPage();
        }
        if (state is RemoteAuthLoggedOut) {
          if (!(page is LoginPage ||
              page is SignUpPage ||
              page is VerifyPage)) {
            return const LoginPage();
          }
          return page;
        }
        if (state is RemoteAuthLoading) {
          return const Scaffold(
            body: Center(child: RefreshProgressIndicator()),
          );
        }
        if (state is RemoteAuthLoggedIn) {
          return page;
        }
        return const SizedBox();
      },
    );
  }
}
