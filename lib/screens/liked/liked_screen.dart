import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'components/body.dart';



class LikedScreen extends StatelessWidget {
  static String routeName = "/liked";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
