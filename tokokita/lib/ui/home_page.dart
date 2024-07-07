import 'package:flutter/material.dart';
import 'package:tokokita/ui/produk_page.dart';
import 'package:tokokita/ui/about_me_page.dart';
import 'package:tokokita/bloc/logout_bloc.dart';
import 'package:tokokita/ui/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Kita'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/drawer_header_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 8),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('assets/images/profile_picture.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 8),
                    child: Text(
                      'TOKO KITA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.home,
              title: 'Home',
              page: const HomePage(),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.list,
              title: 'List Produk',
              page: const ProdukPage(),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.info,
              title: 'About Me',
              page: const AboutMePage(),
            ),
            const Divider(), // Divider added here
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await LogoutBloc.logout().then((value) => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()))
                    });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  color: Colors.black54,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'Toko Kita',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black87,
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 56, 153),
                ),
              ),
            ),
            Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProductCard(
                    'assets/images/product4.jpg',
                    'Sepatu',
                    'Rp 400.000',
                  ),
                  _buildProductCard(
                    'assets/images/product5.jpg',
                    'Jaket',
                    'Rp 800.000',
                  ),
                  _buildProductCard(
                    'assets/images/product6.jpg',
                    'Kaos Geoff Max',
                    'Rp 150.000',
                  ),
                  _buildProductCard(
                    'assets/images/product7.jpg',
                    'CPU Gaming',
                    'Rp 12.000.000',
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tentang Toko Kita',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 56, 153),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Toko Kita adalah tujuan utama Anda untuk mendapatkan produk terbaik di pasaran. Kami menawarkan berbagai macam produk berkualitas tinggi yang dirancang untuk memenuhi kebutuhan Anda dan melampaui harapan Anda.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10),
                  Image.asset('assets/splash.png'),
                  SizedBox(height: 10),
                  Text(
                    'Di Toko Kita, kami memahami bahwa setiap pelanggan memiliki kebutuhan yang unik, itulah sebabnya kami menyediakan pilihan produk yang sangat beragam. Mulai dari elektronik canggih, peralatan rumah tangga yang efisien, hingga gadget terbaru dan aksesori modis, semua tersedia di sini. Kami tidak hanya fokus pada kualitas produk, tetapi juga pada layanan pelanggan yang luar biasa. Tim kami selalu siap membantu Anda menemukan produk yang tepat dan memberikan saran yang berguna untuk memastikan Anda mendapatkan pengalaman belanja yang memuaskan.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context,
      {required IconData icon, required String title, required Widget page}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Widget _buildProductCard(String imagePath, String title, String price) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: () {
          // Implementasi jika produk di-tap
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black54,
                Colors.black12,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black87,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                Text(
                  price,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
