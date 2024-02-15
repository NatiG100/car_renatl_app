import 'package:flutter/material.dart';

class CustomTitleBar extends StatelessWidget {
  const CustomTitleBar({
    super.key,
    this.navigatesToBack = true,
    required this.title,
  });
  final bool navigatesToBack;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        right: 50,
        left: 20,
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const Expanded(
            child: Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
