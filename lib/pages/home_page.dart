import 'package:donasi/models/user_model.dart';
import 'package:donasi/providers/auth_provider.dart';
import 'package:donasi/theme.dart';
import 'package:donasi/utility/carousel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavbar = 0;

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
        title: Text('Dashboard'),
        elevation: 0.1,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          // Carousel
          Container(
            height: 300,
            child: Carousel(
              // Gambar-gambar carousel
              images: [
                AssetImage('image1.jpg'),
                AssetImage('image2.jpg'),
                AssetImage('image3.jpg'),
              ],
            ),
          ),

          // Deskripsi panti asuhan
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Panti Asuhan Al Ummah Ponorogo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.grey.shade200,
                  child: SizedBox(
                    height: 85,
                    child: Text(
                      'Merupakan panti asuhan yang berada di Kabupaten Ponorogo. Panti asuhan ini merawat dan mendidik anak-anak yatim piatu serta anak-anak terlantar. Panti Asuhan Al Ummah Ponorogo memenuhi kebutuhan anak-anak yang dirawat mulai dari makanan hingga sekolah.'
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Info rekening
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Info Rekening',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Rekening ZISWAF',
                  style: TextStyle(
                    fontWeight: bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('KODE (002) 6493-01-024883-536'),
                Text('a.n. Yayasan Dana Sosial Al Ummah'),
                SizedBox(height: 10),
                Text('KODE (114) 0932067749'),
                Text('a.n. LKSA Panti Asuhan Al Ummah'),
              ],
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
