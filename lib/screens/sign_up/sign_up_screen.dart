import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'components/body.dart';



class SignUpScreen extends StatelessWidget {




  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
