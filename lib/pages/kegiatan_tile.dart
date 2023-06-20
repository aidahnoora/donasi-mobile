import 'package:flutter/material.dart';
import 'package:donasi/models/kegiatan_model.dart';

class KegiatanTile extends StatelessWidget {
  final KegiatanModel kegiatan;

  KegiatanTile(this.kegiatan);

  @override
  Widget build(BuildContext context) {
    String baseurl = 'http://192.168.0.107:8000/';
    String url = kegiatan.url!;
    String result = url.replaceAll('http://localhost', '');

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Menentukan radius border
        color: Colors.grey.shade200, // Warna latar belakang
      ),
      child: SizedBox(
        child: Row(
          children: [
            ClipRect(
              child: Image.network(
                '${baseurl}${result}',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kegiatan.judul!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    kegiatan.keterangan!,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
