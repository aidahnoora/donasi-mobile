import 'package:donasi/models/kegiatan_model.dart';
import 'package:donasi/services/kegiatan_service.dart';
import 'package:flutter/material.dart';

class KegiatanProvider extends ChangeNotifier {
  List<KegiatanModel> _kegiatans = [];

  List<KegiatanModel> get kegiatans => _kegiatans;

  set kegiatans(List<KegiatanModel> kegiatans) {
    _kegiatans = kegiatans;
    notifyListeners();
  }

  Future<void> getKegiatan() async {
    try {
      List<KegiatanModel> kegiatans = await KegiatanService().getKegiatan();
      _kegiatans = kegiatans;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}