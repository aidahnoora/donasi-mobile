import 'package:donasi/models/user_model.dart';

class DonasiModel {
  int? id;
  String? nama;
  double? nominal;
  DateTime? tglBayar;

  DonasiModel({
    this.id,
    this.nama,
    this.nominal,
    this.tglBayar,
  });

  factory DonasiModel.fromJson(Map<String, dynamic> json) => DonasiModel(
        id: json['id'],
        nama: json['user']['nama'],
        nominal: double.parse(json['nominal'].toString()),
        tglBayar: DateTime.parse(json['tgl_bayar']),
      );

  Map<String, dynamic> toJson() => {
      'id': id,
      'nama': nama,
      'nominal': nominal,
      'tgl_bayar': tglBayar.toString(),
  };
}

class UninitializedDonasinModel extends DonasiModel {}
