import 'package:car_renatl_app/core/widgets/full_loading.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_bloc.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_state.dart';
import 'package:car_renatl_app/features/auth/presentation/pages/login_page.dart';
import 'package:car_renatl_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  AppRoutes({required this.context});
  BuildContext context;
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/register':
        return _materialRoute(_authRender(context, const SignUpPage()));
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
        if (state is RemoteAuthLoading) {
          return const FullLoading();
        }
        if (state is RemoteAuthInactive) {
          return const Text("Activate account");
        }
        if (state is RemoteAuthLoggedOut) {
          return page;
        }
        if (state is RemoteAuthLoggedOut) {
          return const Text("Main page");
        }
        return const SizedBox();
      },
    );
  }
}
