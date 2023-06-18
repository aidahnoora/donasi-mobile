class UserModel {
  final int id;
  final String nama;
  final String email;
  final String alamat;
  final String noTelp;
  String? token;

  UserModel({
    required this.id,
    required this.nama,
    required this.email,
    required this.alamat,
    required this.noTelp,
    this.token
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel (
    id: json['id'],
    nama: json['nama'],
    email: json['email'],
    alamat: json['alamat'],
    noTelp: json['no_telp'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'no_telp': noTelp,
      'token': token,
    };
  }
}