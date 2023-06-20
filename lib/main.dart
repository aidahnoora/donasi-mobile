import 'package:donasi/pages/donasi_page.dart';
import 'package:donasi/pages/home_page.dart';
import 'package:donasi/pages/kegiatan_page.dart';
import 'package:donasi/pages/profile_page.dart';
import 'package:donasi/pages/sign_in_page.dart';
import 'package:donasi/pages/sign_up_page.dart';
import 'package:donasi/providers/auth_provider.dart';
import 'package:donasi/providers/donasi_provider.dart';
import 'package:donasi/providers/kegiatan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => KegiatanProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DonasiProvider(),
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
           '/profil':(context) => ProfilePage(),
           '/kegiatan':(context) => KegiatanPage(),
           '/donasi':(context) => DonasiPage(),
        },
      ),
    );
  }
}
