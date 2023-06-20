import 'package:donasi/pages/donasi_tile.dart';
import 'package:donasi/providers/donasi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonasiPage extends StatefulWidget {
  const DonasiPage({Key? key}) : super(key: key);

  @override
  State<DonasiPage> createState() => _DonasiPageState();
}

class _DonasiPageState extends State<DonasiPage> {
  int _selectedNavbar = 2;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    DonasiProvider donasiProvider = Provider.of<DonasiProvider>(context);
    donasiProvider.getDonasi();

    Widget content() {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: donasiProvider.donasis
                .map(
                  (donasi) => DonasiTile(donasi),
                )
                .toList(),
          ),
        ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Donasi Terkumpul'),
        elevation: 0.1,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              content(),
            ],
          ),
        ),
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