import 'package:flutter/material.dart';
import 'review_screen.dart';
import 'favorite_screen.dart';
import 'news_screen.dart'; // Import NewsScreen
import 'crud_screen.dart'; // Import CrudScreen

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> _favoriteMovies = [];

  void _addToFavorites(String movieTitle) {
    setState(() {
      if (!_favoriteMovies.contains(movieTitle)) {
        _favoriteMovies.add(movieTitle);
      }
    });
    // Navigate to FavoriteScreen after adding the movie to favorites
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FavoriteScreen(favoriteMovies: _favoriteMovies, removeFromFavorites: _removeFromFavorites)),
    );
  }

  void _removeFromFavorites(String movieTitle) {
    setState(() {
      _favoriteMovies.remove(movieTitle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Latihan API'),
              onTap: () {
                // Navigate to NewsScreen when "Latihan API" menu is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Crud Screen'),
              onTap: () {
                // Navigate to CrudScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTypes()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFilmWidget(context, 'Spongebob', 'https://www.usatoday.com/gcdn/-mm-/e01a68e45bc8a63ae40aaa29d1392a31e4f0e4bd/c=12-0-2874-1619/local/-/media/USATODAY/USATODAY/2014/07/24/1406185057000-NewSponge.JPG'),
            _buildFilmWidget(context, 'Harry Potter', 'https://images.tokopedia.net/img/KRMmCm/2022/10/3/a13b45d0-e55a-4272-ada5-c23184c80e5b.jpg'),
            _buildFilmWidget(context, 'Cars', 'https://cdn.akamai.steamstatic.com/steam/apps/331160/capsule_616x353.jpg?t=1682468682'),
          ],
        ),
      ),
    );
  }

  Widget _buildFilmWidget(BuildContext context, String title, String imageUrl) {
    bool isFavorite = _favoriteMovies.contains(title);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReviewScreen(title: title, imageUrl: imageUrl)),
        );
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                isFavorite ? _removeFromFavorites(title) : _addToFavorites(title);
              },
            ),
          ],
        ),
      ),
    );
  }
}
