import 'package:donasi/models/donasi_model.dart';
import 'package:donasi/services/donasi_service.dart';
import 'package:flutter/material.dart';

class DonasiProvider extends ChangeNotifier {
  List<DonasiModel> _donasis = [];

  List<DonasiModel> get donasis => _donasis;

  set donasis(List<DonasiModel> donasis) {
    _donasis = donasis;
    notifyListeners();
  }

  Future<void> getDonasi() async {
    try {
      List<DonasiModel> donasis = await DonasiService().getDonasi();
      _donasis = donasis;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}