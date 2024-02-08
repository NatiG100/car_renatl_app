import 'package:car_renatl_app/config/routes/routes.dart';
import 'package:car_renatl_app/config/theme/app_theme.dart';
import 'package:car_renatl_app/core/widgets/full_loading.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_article_event.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_article_state.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_bloc.dart';
import 'package:car_renatl_app/features/auth/presentation/pages/login_page.dart';
import 'package:car_renatl_app/features/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => sl()..add(WhoAmIevent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        home: _authRender(context),
      ),
    );
  }
}

Widget _authRender(BuildContext context) {
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
        return const LoginPage();
      }
      if (state is RemoteAuthLoggedOut) {
        return const Text("Main page");
      }
      return const SizedBox();
    },
  );
}
