import 'package:flutter/material.dart';
import 'pages/homepage.dart';

// Halaman Login
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  bool isLoginSukses = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hallo"), 
          backgroundColor: const Color.fromARGB(255, 48, 218, 79),
          
        ),
        
        body: Column(
          children: [
            _usernameField(), 
            _passwordField(), 
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value; 
        },
        decoration: const InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value; 
        },
        obscureText: true, 
        decoration: const InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color.fromARGB(255, 43, 255, 142)),
          ),
        ),
      ),
    );
  }

  // tombol login
  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255), 
          backgroundColor: (isLoginSukses)
              ? const Color.fromARGB(255, 0, 198, 72) 
              : Colors.red, 
        ),
        onPressed: () {
          String text = "";

          // Cek username & password
          if (username == "hanif" && password == "009") {
            setState(() {
              text = "Login Berhasil"; 
              isLoginSukses = true;
            });

            
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Homepage(username: username);
                },
              ),
            );
          } else {
            setState(() {
              text = "Login Gagal"; 
              isLoginSukses = false;
            });
          }

          
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}
