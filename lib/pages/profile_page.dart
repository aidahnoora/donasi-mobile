import 'package:donasi/models/user_model.dart';
import 'package:donasi/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedNavbar = 3;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        elevation: 0.1,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.green.shade300],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  user.nama,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Donatur',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    user.email,
                    style: TextStyle(),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Alamat',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    user.alamat,
                    style: TextStyle(),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Nomor Telepon',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    user.noTelp,
                    style: TextStyle(),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.all(40),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Icon(Icons.home),
              ),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/kegiatan');
                },
                child: Icon(Icons.assignment),
              ),
            ),
            label: 'Kegiatan',
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/donasi');
                },
                child: Icon(Icons.money),
              ),
            ),
            label: 'Donasi',
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profil');
                },
                child: Icon(
                  Icons.person
                ),
              ),
            ),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
