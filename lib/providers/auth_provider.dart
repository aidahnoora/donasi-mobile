import 'package:flutter/material.dart';
import 'package:donasi/models/user_model.dart';
import 'package:donasi/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? nama,
    String? email,
    String? password,
    String? alamat,
    String? noTelp,
  }) async {
    try {
      UserModel user = await AuthService().register(
        nama: nama,
        email: email,
        password: password,
        alamat: alamat,
        noTelp: noTelp,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
