import 'dart:convert';

import 'package:donasi/models/donasi_model.dart';
import 'package:http/http.dart' as http;

class DonasiService {
  String baseUrl = 'http://192.168.0.107:8000/api';

  Future<List<DonasiModel>> getDonasi() async {
    var url = '$baseUrl/donasi';
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

      List<DonasiModel> donasis = [];

      for (var item in data) {
        donasis.add(DonasiModel.fromJson(item));
      }

      return donasis;
    } else {
      throw Exception('Gagal get donasi');
    }
  }
}