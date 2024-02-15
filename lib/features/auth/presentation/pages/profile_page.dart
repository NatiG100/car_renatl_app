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
    return Scaffold(
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
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/placeholder.jpg"),
                          radius: 35,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ronald Richard",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              Text("natnael@gmail.com")
                            ],
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
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
    );
  }
}
