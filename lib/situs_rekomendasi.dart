import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DaftarSitusRekomendasiPage extends StatefulWidget {
  const DaftarSitusRekomendasiPage({super.key});

  @override
  _DaftarSitusRekomendasiPageState createState() => _DaftarSitusRekomendasiPageState();
}

class _DaftarSitusRekomendasiPageState extends State<DaftarSitusRekomendasiPage> {
  // To store the favorite status of each card
  final Map<String, bool> _isFavorite = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFDD4D7),
      appBar: AppBar(
        title: const Text('Daftar Situs Rekomendasi', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFF2808A),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Title for Cake and Brownies
              const Text(
                'Cake and Brownies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold, color: Color(0xFFB8445E)
                ),
              ),
              const SizedBox(height: 16.0),

              // List of Dessert Cards (Cake and Brownies)
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFoodCard(
                      context,
                      'Cupcake',
                      'assets/images/cupcake.jpg',
                      'https://cookpad.com/id/resep/22576790-blueberry-cupcakes?ref=search&search_term=cupcake',
                    ),
                    _buildFoodCard(
                      context,
                      'Black Forest Cake',
                      'assets/images/black.jpg',
                      'https://www.yummy.co.id/resep/blackforrest',
                    ),
                    _buildFoodCard(
                      context,
                      'Red Velvet Cake',
                      'assets/images/velvet.jpg',
                      'https://cookpad.com/id/resep/24125277-bolu-red-velvet',
                    ),
                    _buildFoodCard(
                      context,
                      'Fudgie Brownies',
                      'assets/images/brownis.jpg',
                      'https://cookpad.com/id/resep/16028801-fudgie-brownies',
                    ),
                    _buildFoodCard(
                      context,
                      'Rainbow Cake',
                      'assets/images/rainbow.jpg',
                      'https://cookpad.com/id/resep/17158162-rainbow-cake-kukus',
                    ),
                    _buildFoodCard(
                      context,
                      'Tiramisu Cake',
                      'assets/images/tiramisu.jpg',
                      'https://cookpad.com/id/resep/22601007-tiramisu-dessert-box',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // Title for Kue Basah
                const Text(
                'Dessert',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold, color: Color(0xFFB8445E)
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFoodCard(
                      context,
                      'Croissant',
                      'assets/images/croisant.jpg',
                      'https://cookpad.com/id/resep/17209732-croissant',
                    ),
                    _buildFoodCard(
                      context,
                      'Cinnamon Roll',
                      'assets/images/cinamon.jpg',
                      'https://cookpad.com/id/resep/22582032-cinnamon-roll-bread-dengan-gula-merah',
                    ),
                    _buildFoodCard(
                      context,
                      'Macaron',
                      'assets/images/macaron.jpg',
                      'https://cookpad.com/id/resep/17222949-macaron-tepung-almond',
                    ),
                    _buildFoodCard(
                      context,
                      'Puding Karamel',
                      'assets/images/puding.jpg',
                      'https://cookpad.com/id/resep/24021573-japanese-caramel-pudding',
                    ),
                    _buildFoodCard(
                      context,
                      'Donat',
                      'assets/images/donat.jpg',
                      'https://cookpad.com/id/resep/16384497-donat-tanpa-kentang-topping-glaze',
                    ),
                    _buildFoodCard(
                      context,
                      'Nastar',
                      'assets/images/nastar.jpg',
                      'https://cookpad.com/id/resep/23877292-nastar-nanas',
                    ),
                  ],
                ),
              ),
               const SizedBox(height: 16.0),
               
              const Text(
                'Kue Basah',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold, color: Color(0xFFB8445E)
                ),
              ),
              const SizedBox(height: 16.0),
              // List of Kue Basah Cards
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFoodCard(
                      context,
                      'Klepon',
                      'assets/images/klepon.jpg',
                      'https://cookpad.com/id/resep/24101567-klepon-pandan',
                    ),
                    _buildFoodCard(
                      context,
                      'Kue Lapis',
                      'assets/images/lapis.jpg',
                      'https://cookpad.com/id/resep/23981622-kue-lapis-rainbow',
                    ),
                    _buildFoodCard(
                      context,
                      'Dadar Gulung',
                      'assets/images/dadar.jpg',
                      'https://cookpad.com/id/resep/17287481-212-kue-dadar-gulung-pandan-isi-kelapa',
                    ),
                    _buildFoodCard(
                      context,
                      'Onde-Onde',
                      'assets/images/onde.jpg',
                      'https://cookpad.com/id/resep/24119349-onde-onde-mudah-anti-gagal',
                    ),
                    _buildFoodCard(
                      context,
                      'Surabi',
                      'assets/images/surabi.jpg',
                      'https://cookpad.com/id/resep/17029728-surabi-bandung-oncom',
                    ),
                    _buildFoodCard(
                      context,
                      'Putu Ayu',
                      'assets/images/putu.jpg',
                      'https://cookpad.com/id/resep/23932965-putu-ayu-pandan',
                    ),
                  ],
                ),
              ),

             

              // Title for Dessert
             

              // List of Dessert Cards (Croissant, Cinnamon Roll, etc.)
              
            ],
          ),
        ),
      ),
    );
  }

  // Method to build individual food cards
  Widget _buildFoodCard(BuildContext context, String foodName, String imagePath, String url) {
    return GestureDetector(
      onTap: () {
        _launchURL(url); // Launch the specific URL for each food item
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            SizedBox(
              width: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                      child: Image.asset(
                        imagePath,
                        width: 550, // Sesuaikan lebar sesuai kebutuhan
                    height: 550,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      foodName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  _isFavorite[foodName] == true
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: _isFavorite[foodName] == true ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    // Ensure that if a key does not exist, it will default to false
                    _isFavorite[foodName] = _isFavorite[foodName] ?? false;
                    _isFavorite[foodName] = !_isFavorite[foodName]!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to launch the URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}