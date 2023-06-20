import 'package:another_flushbar/flushbar.dart';
import 'package:donasi/providers/auth_provider.dart';
import 'package:donasi/utility/validator.dart';
import 'package:donasi/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        Flushbar(
          title: 'Gagal login!',
          message: 'Periksa kembali email dan password Anda.',
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
            'Register',
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: 
        Container(
          padding: EdgeInsets.all(40),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo1.png', // Lokasi gambar logo di dalam direktori aset (assets)
                  width: 150, // Lebar gambar
                  height: 150, // Tinggi gambar
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Email',
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  autofocus: false,
                  validator: validateEmail,
                  controller: emailController,
                  decoration: buildInputDecoration(
                    'Masukkan Email',
                    Icons.email
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Password',
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  validator: (value)=> value == null ? "Masukkan password yang benar" : null,
                  controller: passwordController,
                  decoration: buildInputDecoration(
                    'Masukkan Password',
                    Icons.lock
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                longButtons(
                  'Login',
                  handleSignIn
                ),
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