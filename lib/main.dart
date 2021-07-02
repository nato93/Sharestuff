import 'package:flutter/material.dart';
import 'package:dcdg/dcdg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/authentication_service.dart';




Future<void> main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),

          StreamProvider(
            create: (context) => context.read<AuthenticationService>().authStateChanges,
          ),
        ],
        child: MaterialApp(
          title: 'Sharestuff',
          theme: theme(),
          initialRoute: SplashScreen.routeName,
          routes: routes,
          home: AuthenticationWrapper(),
        ));
  }
}




class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
//Should return to homescreen if there's a user logged in already.
      return HomeScreen();
    }
    return SignUpScreen();
  }
}