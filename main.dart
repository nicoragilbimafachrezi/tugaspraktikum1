import 'package:flutter/material.dart';
import 'store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'buah dan sayuran segar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'tugas praktikum1'),
        '/store': (context) => const StorePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _navigateToStore(String foodName) {
    Navigator.pushNamed(context, '/store', arguments: {'foodName': foodName});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://cdn.pixabay.com/photo/2013/07/13/01/22/vegetables-155616_1280.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                _navigateToStore('Tersedia Buah');
              },
              child: Text('Pilih buah'),
            ),
            ElevatedButton(
              onPressed: () {
                _navigateToStore('Diskon Page');
              },
              child: Text('Diskon harga'),
            ),
            ElevatedButton(
              onPressed: () {
                _navigateToStore('Paket spesial page');
              },
              child: Text('Paket Spesial'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.store),
              onPressed: () {
                _navigateToStore('Menu utama');
              },
            ),
          ],
        ),
      ),
    );
  }
}