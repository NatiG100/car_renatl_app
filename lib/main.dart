import 'package:car_renatl_app/config/routes/routes.dart';
import 'package:car_renatl_app/config/theme/app_theme.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_event.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_bloc.dart';
import 'package:car_renatl_app/features/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  OverlayEntry? loadingOverlayEntry;
  _createLoadingOverlay(BuildContext context) {
    loadingOverlayEntry = OverlayEntry(builder: (BuildContext context) {
      return Positioned(
        top: 0,
        left: 0,
        bottom: 0,
        right: 0,
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(120),
            ),
          ),
        ),
      );
    });
    Overlay.of(context).insert(loadingOverlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => sl()..add(WhoAmIevent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        onGenerateRoute: AppRoutes(context: context).onGenerateRoute,
        builder: (context, child) {
          // _createLoadingOverlay(context);
          return child ?? const SizedBox();
        },
      ),
    );
  }
}
