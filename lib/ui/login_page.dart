import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() async {
    final SharedPreferences prefs = await _prefs;
    final Map<String, dynamic> credential = {
      "name": "admin",
      "password": "admin"
    };
    final Map<String, dynamic> inputCredential = {
      "name": _nameController.text,
      "password": _passwordController.text
    };

    // Cek Login
    if (inputCredential['name'] == credential['name'] &&
        inputCredential['password'] == credential['password']) {
      print("Berhasil Login");
    } else {
      print("Gagal Login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              _textField("Name", false, _nameController),
              _textField("Password", true, _passwordController),
              SizedBox(
                height: 20,
              ),
              _loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(
      String label, bool obscure, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(onPressed: login, child: Text("Login"));
  }
}
