import 'package:donasi/pages/sign_in_page.dart';
import 'package:donasi/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
         '/sign-in': (context) => SignInPage(),
      },
    );
  }
}
