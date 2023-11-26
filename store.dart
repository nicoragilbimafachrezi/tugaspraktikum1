import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the arguments passed to this page
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String foodName = args['foodName'];

    // Define variables for image and description
    late String imageUrl;
    late String description;

    // Set image and description based on selected food
    if (foodName == 'Tersedia Buah') {
      imageUrl =
          'https://cdn.pixabay.com/photo/2013/07/13/01/22/vegetables-155616_1280.png';
      description = 'Semangka,Pisang,Stroberi Rp 30.000';
    } else if (foodName == 'Diskon Page') {
      imageUrl =
          'https://cdn.pixabay.com/photo/2013/07/13/01/22/vegetables-155616_1280.png';
      description = 'Diskon spesial buah dan sayuran Rp.50.000';
      // Tambahkan logika untuk halaman 2 jika diperlukan
    } else if (foodName == 'Paket spesial page') {
      imageUrl =
          'https://cdn.pixabay.com/photo/2013/07/13/01/22/vegetables-155616_1280.png';
      description = 'Paket Buah buahan dan sayuran Rp.120.000';
      // Tambahkan logika untuk halaman 3 jika diperlukan
    } else {
      // Default values if no match is found
      imageUrl =
          'https://cdn.pixabay.com/photo/2013/07/13/01/22/vegetables-155616_1280.png';
      description = '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              imageUrl,
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showAddToCartDialog(context);
              },
              child: Text('Tambahkan ke keranjang'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show a simple pop-up dialog
  void _showAddToCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('pesanan ada sedang dalam proses pengiriman '),
          content: Text('Terimakasih '),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}