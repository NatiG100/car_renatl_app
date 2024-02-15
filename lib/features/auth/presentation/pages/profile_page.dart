import 'package:car_renatl_app/core/widgets/bottom_navigation.dart';
import 'package:car_renatl_app/core/widgets/title_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TitleBar(
        title: "Profile",
      ),
      bottomNavigationBar: AppBottomNavigation(
        page: AppPage.profile,
      ),
    );
  }
}
