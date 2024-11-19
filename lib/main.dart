import 'package:flutter/material.dart';
import 'daftar_page.dart';
import 'package:tugas/stopwatch_page.dart';
import 'dashboard_page.dart';
import 'login_page.dart';
import 'package:tugas/situs_rekomendasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 2 Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
      //DashboardPage(username: 'username',),
    );
  }
}