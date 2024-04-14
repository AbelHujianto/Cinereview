import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<String> favoriteMovies;
  final Function(String) removeFromFavorites; 

  const FavoriteScreen({
    Key? key,
    required this.favoriteMovies,
    required this.removeFromFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
      ),
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteMovies[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                removeFromFavorites(favoriteMovies[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
