import 'package:donasi/pages/home_page.dart';
import 'package:donasi/pages/sign_in_page.dart';
import 'package:donasi/pages/sign_up_page.dart';
import 'package:donasi/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Donasi',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignInPage(),
        routes: {
           '/login': (context) => SignInPage(),
           '/register': (context) => SignUpPage(),
           '/home':(context) => HomePage(),
        },
      ),
    );
  }
}
