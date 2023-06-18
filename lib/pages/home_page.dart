import 'package:donasi/models/user_model.dart';
import 'package:donasi/providers/auth_provider.dart';
import 'package:donasi/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 0.1,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text('${user.nama}'),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            width: 200,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              textColor: Colors.white,
              color: Colors.green,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Logout',
                  textAlign: TextAlign.center,
                ),
              ),
              height: 45,
              minWidth: 600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
