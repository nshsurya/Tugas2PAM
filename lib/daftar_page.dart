import 'package:flutter/material.dart';

class DaftarAnggotaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFDD4D7),
      appBar: AppBar(
        title: Text('Daftar Anggota',style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFF2808A),
      ),
      body: 
      
      ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          // Card for Anggota 1
          Card(
            color: Colors.white,
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  // Foto Anggota
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/jaya.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  // Biodata Anggota
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nama: Muhammad Wijaya',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFB8445E)),
                        ),
                        SizedBox(height: 8.0),
                        Text('NIM : 124220045'),
                        Text('Hobi: Bermain Mobile Legend'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Card for Anggota 2
          Card(
            color: Colors.white,
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  // Foto Anggota
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/surya.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  // Biodata Anggota
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nama: Suryaningsih',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFB8445E)),
                        ),
                        SizedBox(height: 8.0),
                        Text('NIM : 124220050'),
                        Text('Hobi: Memasak'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Card for Anggota 3
          Card(
            color: Colors.white,
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  // Foto Anggota
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/silvi.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  // Biodata Anggota
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nama: Silvia Melinda Yuniar',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFFB8445E)),
                        ),
                        SizedBox(height: 8.0),
                        Text('NIM : 124220053'),
                        Text('Hobi: Mabar Bersama Sahabat'),
                      ],
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
}