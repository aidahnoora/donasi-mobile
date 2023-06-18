String? validateEmail(String? value) {
  String? _msg;
  RegExp regex = new RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'
  );

  if(value == null) {
    _msg = "Your email is required";
  } else if (!regex.hasMatch(value)) {
    _msg = "Masukkan email yang benar";
  }
  return _msg;
}