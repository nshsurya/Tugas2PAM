import 'package:flutter/material.dart';

import 'dashboard_page.dart';

bool _isHidden = true;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFFF2808A),
      ),
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.fill, // Gambar menutupi seluruh layar
              ),
            ),
          ),
          // Centered Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Image.asset(
                    'assets/images/poto3.png', 
                    width: 140, // Sesuaikan lebar sesuai kebutuhan
                    height: 160, // Sesuaikan tinggi sesuai kebutuhan
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20), // Spasi antara gambar dan kotak login
                  // Kotak Login
                  Container(
                    width: 300,
                    // Hapus height agar menyesuaikan konten secara otomatis
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFD95F76),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: const Color(0xFFFDD4D7).withOpacity(0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Sesuaikan tinggi berdasarkan konten
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _usernameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _passwordController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD95F76))
                              ),
                              suffixIcon: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  _isHidden ? Icons.visibility : Icons.visibility_off,
                                ),
                              ),
                            ),
                            obscureText: _isHidden,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _login,
                            child: Text('Login', style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 36 ), 
                              backgroundColor: Color(0xFFD95F76)// Tombol memenuhi lebar kotak
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Ganti dengan logika autentikasi yang sesuai
    if (username == "admin" && password == "admin") {
      // Login Berhasil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(username: username),
        ),
      );
    } else {
      // Login Gagal
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Gagal"),
            content: Text("Username dan Password salah"),
            actions: [
              TextButton(
                child: Text("Tutup"),
                onPressed: () => Navigator.of(context).pop(), // Tutup popup
              ),
            ],
          );
        },
      );
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
