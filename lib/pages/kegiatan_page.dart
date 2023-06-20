import 'package:donasi/pages/kegiatan_tile.dart';
import 'package:donasi/providers/kegiatan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KegiatanPage extends StatefulWidget {
  @override
  State<KegiatanPage> createState() => _KegiatanPageState();
}

class _KegiatanPageState extends State<KegiatanPage> {
  int _selectedNavbar = 1;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    KegiatanProvider kegiatanProvider = Provider.of<KegiatanProvider>(context);
    kegiatanProvider.getKegiatan();

    Widget content() {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: kegiatanProvider.kegiatans
                .map(
                  (kegiatan) => KegiatanTile(kegiatan),
                )
                .toList(),
            // children: [
            //   KegiatanTile(),
            // ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatan'),
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
                child: Icon(Icons.person),
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
