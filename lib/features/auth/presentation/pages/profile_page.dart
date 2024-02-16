import 'package:car_renatl_app/core/widgets/bottom_navigation.dart';
import 'package:car_renatl_app/core/widgets/title_bar.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_bloc.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_event.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  logoutHandler(BuildContext context) {
    return () {
      BlocProvider.of<AuthBloc>(context).add(
        LogoutEvent(),
      );
      Navigator.of(context).pushReplacementNamed('/login');
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, RemoteAuthState>(
      builder: (context, state) => Scaffold(
        body: Column(
          children: [
            const CustomTitleBar(title: "Profile"),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          state.user?.profileImageUrl != null
                              ? const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/images/placeholder.jpg"),
                                  radius: 20,
                                )
                              : const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/images/placeholder.jpg"),
                                  radius: 20,
                                ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.user?.fullName ?? "",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(state.user?.emailAddress ?? "")
                              ],
                            ),
                          ),
                          TextButton.icon(
                            onPressed: logoutHandler(context),
                            icon: const Icon(Icons.logout),
                            label: const Text("Logout"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColor.withAlpha(22),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: const AppBottomNavigation(
          page: AppPage.profile,
        ),
      ),
    );
  }
}
