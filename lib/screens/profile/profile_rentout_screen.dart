import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/models/authentication_service.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

import '../../enums.dart';

class ProfileRentOutScreen extends StatelessWidget{
  static String routeName = "/profile_rentout_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Whats your UID"),
            ElevatedButton(
              onPressed: (){

                if(context.read<AuthenticationService>().getUID().toString() != null){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(context.read<AuthenticationService>().getUID().toString()),
                  ));

                  } else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("No user is signed-in!")
                  ));
                }

              },
              child: Text("Get it!"),

            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),

    );
  }

}