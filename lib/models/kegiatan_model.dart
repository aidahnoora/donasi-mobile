class KegiatanModel {
  final int? id;
  final String? judul;
  final String? url;
  final String? keterangan;

  KegiatanModel({
    this.id,
    this.judul,
    this.url,
    this.keterangan,
  });

  factory KegiatanModel.fromJson(Map<String, dynamic> json) => KegiatanModel(
        id: json['id'],
        judul: json['judul'],
        url: json['url'],
        keterangan: json['keterangan'],
      );

  Map<String, dynamic> toJson() => {
    
      'id': id,
      'judul': judul,
      'url': url,
      'keterangan': keterangan,
  };
}

class UninitializedKegiatanModel extends KegiatanModel {}
