import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';




class MessagesScreen extends StatelessWidget {
  static String routeName = "/messages";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
