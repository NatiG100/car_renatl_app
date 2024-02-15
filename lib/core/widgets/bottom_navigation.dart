import 'package:flutter/material.dart';

enum AppPage {
  home,
  booking,
  profile,
}

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key, this.page = AppPage.home});
  final AppPage page;

  @override
  Widget build(BuildContext context) {
    navigateToHome() {
      Navigator.of(context).pushNamed('/home');
    }

    navigateToProfile() {
      Navigator.of(context).pushNamed('/profile');
    }

    return BottomNavigationBar(
      currentIndex: page.index,
      onTap: (value) {
        if (page.index == value) {
          return;
        }
        switch (value) {
          case 0:
            navigateToHome();
            break;
          case 2:
            navigateToProfile();
            break;
          default:
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.car_rental),
          label: "My Booking",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "My Profile",
        ),
      ],
    );
  }
}
