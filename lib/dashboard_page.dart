import 'package:flutter/material.dart';
import 'daftar_page.dart';
import 'package:tugas/stopwatch_page.dart';
import 'package:tugas/situs_rekomendasi.dart';

class DashboardPage extends StatefulWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0; // Track the index of selected BottomNavigationBar item

  // List of pages for BottomNavigationBar items
  List<Widget> _pages() {
    return <Widget>[
      _buildMainMenu(),  // Main Menu page (the one with cards)
      _buildHelpPage(context),  // Help page
    ];
  }

  // Function to build the Main Menu page
  Widget _buildMainMenu() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        // Welcome message
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Welcome, ${widget.username}!', // Display username here
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFB8445E)),
          ),
        ),
        // Card for 'Daftar Anggota'
        Card(
          color: Colors.white,
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(Icons.people, color: const Color(0xFFD95F76),),
            title: Text('Daftar Anggota'),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DaftarAnggotaPage()),);
              // Navigate to Daftar Anggota page
            },
          ),
        ),
        // Card for 'Aplikasi Stopwatch'
        Card(
          color: Colors.white,
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(Icons.timer, color: const Color(0xFFD95F76),),
            title: Text('Aplikasi Stopwatch'),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  StopwatchPage()),);
            
              // Navigate to Aplikasi Stopwatch page
            },
          ),
        ),
        // Card for 'Daftar Situs Rekomendasi'
        Card(
          color: Colors.white,
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(Icons.web, color: const Color(0xFFD95F76),),
            title: Text('Daftar Situs Rekomendasi'),
            subtitle: Text('Klik untuk melihat situs rekomendasi', style: TextStyle(color: Color(0xFFB8445E),)),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  DaftarSitusRekomendasiPage()),);
              // Navigate to Daftar Situs Rekomendasi page
            },
          ),
        ),
        // Card for 'Favorite'
        Card(
          color: Colors.white,
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(Icons.favorite,color: const Color(0xFFD95F76),),
            title: Text('Favorite'),
            onTap: () {
              // Navigate to Favorite page
            },
          ),
        ),
      ],
    );
  }

  // Function to build the Help Page
  Widget _buildHelpPage(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cara Penggunaan Aplikasi',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            '1. Daftar Anggota: '
                'Navigasikan ke menu ini untuk melihat daftar anggota yang terdaftar dalam aplikasi.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '2. Aplikasi Stopwatch: '
                'Gunakan fitur ini untuk menghitung waktu. '
                'Tekan "Start" untuk memulai stopwatch, "Stop" untuk menghentikannya, '
                'dan "Reset" untuk mengatur ulang ke nol. Anda juga dapat menambahkan waktu lap dengan menekan "Flag".',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '3. Daftar Situs Rekomendasi: '
                'Di sini Anda dapat menemukan daftar situs web yang direkomendasikan.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '4. Favorite: '
                'Tambahkan item favorit Anda ke dalam daftar ini untuk akses cepat.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 24),
          // Logout Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Implement logout functionality here
                // Example: Navigator.of(context).pushReplacementNamed('/login');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to handle item tap in BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFDD4D7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dashboard Page', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFF2808A),
      ),
      body: _pages()[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu Utama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help, color:Color(0xFFF2808A)),
            label: 'Bantuan',
          ),
        ],
        currentIndex: _selectedIndex, // Track the selected index
        selectedItemColor: Color(0xFFB8445E), // Color of selected icon
        onTap: _onItemTapped, // Handle the tap on BottomNavigationBar
      ),
    );
  }
}