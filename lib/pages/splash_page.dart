import 'dart:async';

import 'package:donasi/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5), () => Navigator.pushNamed(context, '/sign-in'),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 170,
          height: 190,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image_logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}