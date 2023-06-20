import 'dart:convert';

import 'package:donasi/models/kegiatan_model.dart';
import 'package:http/http.dart' as http;

class KegiatanService {
  String baseUrl = 'http://192.168.0.107:8000/api';

  Future<List<KegiatanModel>> getKegiatan() async {
    var url = '$baseUrl/kegiatan';
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      Uri.parse(url), 
      headers: headers
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<KegiatanModel> kegiatans = [];

      for (var item in data) {
        kegiatans.add(KegiatanModel.fromJson(item));
      }

      return kegiatans;
    } else {
      throw Exception('Gagal get kegiatan');
    }
  }
}