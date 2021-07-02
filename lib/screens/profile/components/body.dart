import 'package:flutter/material.dart';
import 'package:shop_app/screens/profile/profile_rentout_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:shop_app/screens/profile/profile_settings_screen.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Rent Out Item",
            icon: "assets/icons/Parcel.svg",
            press: () {
              Navigator.pushNamed(context, ProfileRentOutScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {

            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pushNamed(context, ProfileSettingsScreen.routeName);

            },
          ),
        ],
      ),
    );
  }
}
