import 'package:another_flushbar/flushbar.dart';
import 'package:donasi/providers/auth_provider.dart';
import 'package:donasi/utility/validator.dart';
import 'package:donasi/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController namaController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController alamatController = TextEditingController(text: '');
  TextEditingController noTelpController = TextEditingController(text: '');
  TextEditingController roleController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      if (await authProvider.register(
        nama: namaController.text,
        email: emailController.text,
        password: passwordController.text,
        alamat: alamatController.text,
        noTelp: noTelpController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        Flushbar(
          title: 'Gagal register!',
          message: 'Periksa kembali data Anda.',
          duration: Duration(seconds: 10),
        ).show(context);
      }
    }

    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget> [
        FlatButton(
          padding: EdgeInsets.only(left: 0),
          child: Text(
            'Sudah punya akun? Login',
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text('Nama'),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  autofocus: false,
                  controller: namaController,
                  decoration:
                      buildInputDecoration('Masukkan nama', Icons.people),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Email'),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  autofocus: false,
                  validator: validateEmail,
                  controller: emailController,
                  decoration:
                      buildInputDecoration('Masukkan Email', Icons.email),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Password'),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  validator: (value) =>
                      value == null ? "Masukkan password yang benar" : null,
                  controller: passwordController,
                  decoration:
                      buildInputDecoration('Masukkan Password', Icons.lock),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Alamat'),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  autofocus: false,
                  controller: alamatController,
                  decoration:
                      buildInputDecoration('Masukkan alamat', Icons.map),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Nomor Telepon'),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  autofocus: false,
                  controller: noTelpController,
                  decoration:
                      buildInputDecoration('Masukkan telepon', Icons.phone),
                ),
                SizedBox(
                  height: 20,
                ),
                longButtons('Register', handleSignUp),
                SizedBox(
                  height: 10,
                ),
                forgotLabel
              ],
            ),
          ),
        ),
      ),
    );
  }
}
