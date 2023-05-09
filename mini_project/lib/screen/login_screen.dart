import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool emailValid = false;

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    }
  }

  void validateEmail() {
    final bool isValid = EmailValidator.validate(emailController.text.trim());
    emailValid = isValid;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Masukkan nama pengguna',
                  labelText: 'Nama Pengguna',
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama wajib diisi';
                  } else if (value.length < 2) {
                    return 'Gunakan setidaknya 2 huruf';
                  } else if (!RegExp(r'^[a-zA-Z]').hasMatch(value)) {
                    return 'Nama tidak boleh berupa angka atau simbol';
                  } else if (!RegExp(r'^[A-Z]').hasMatch(value[0])) {
                    return 'Huruf pertama harus kapital';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Masukkan E-Mail',
                    labelText: 'E-Mail',
                    border: OutlineInputBorder(),
                    filled: true),
                validator: (value) {
                  validateEmail();

                  if (value!.isEmpty) {
                    return 'E-Mail wajib diisi';
                  } else if (emailValid == false) {
                    return 'Masukkan E-Mail dengan Benar';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Masukkan Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    filled: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password wajib diisi';
                  } else if (value.length < 5) {
                    return 'Gunakan setidaknya 5 huruf';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    String username = nameController.text;
                    if (formKey.currentState!.validate()) {
                      loginData.setBool('login', false);
                      loginData.setString('username', username);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false);
                    } else {}
                  },
                  child: Text('Log In')),
              SizedBox(
                height: 5,
              ),
            ],
          )),
    );
  }
}
