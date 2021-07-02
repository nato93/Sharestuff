import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/models/authentication_service.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import '../../enums.dart';

class ProfileSettingsScreen extends StatelessWidget{
  static String routeName = "/profile_settings_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Are you sure?"),
            ElevatedButton(
                onPressed: (){
                  context.read<AuthenticationService>().signOut();
                  Navigator.pushNamed(context, SplashScreen.routeName);

                },
              child: Text("Sign out"),

            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),

    );
  }

}