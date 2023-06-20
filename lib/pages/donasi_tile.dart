import 'package:donasi/models/donasi_model.dart';
import 'package:flutter/material.dart';

class DonasiTile extends StatelessWidget {
  final DonasiModel donasi;

  DonasiTile(this.donasi);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
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
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    donasi.nama!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Telah berdonasi sebesar : Rp ${donasi.nominal}',
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
