import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/favorite_screen.dart';
import 'screens/review_screen.dart'; // Import ReviewScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark, // Set dark theme
      ),
      home: const MyHomePage(title: 'Main Screen'),
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
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const MainScreen(),
    FavoriteScreen(favoriteMovies: [], removeFromFavorites: (String movieTitle) {}),
  ];

  final List<String> _appBarTitles = const [
    'Main',
    'Favorite',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToReviewScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReviewScreen(title: 'Review', imageUrl: 'https://example.com/image.jpg')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToReviewScreen,
        child: Icon(Icons.rate_review),
      ),
    );
  }
}
