import 'package:flutter/material.dart';

import 'DataBaseHelper.dart';


class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<Map<String, dynamic>> favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
    DatabaseHelper.instance.favoriteNotifier.addListener(_onFavoritesChanged);
  }

  @override
  void dispose() {
    DatabaseHelper.instance.favoriteNotifier.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  void _onFavoritesChanged() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final loadedFavorites = await DatabaseHelper.instance.getAllFavorites();
    setState(() {
      favorites = loadedFavorites;
    });
  }

  void _removeFavorite(int productId) async {
    await DatabaseHelper.instance.deleteFavorite(productId);
    _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF7643),
                Color(0xff281537),
              ],
            ),
          ),
        ),
        title: Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? Center(
        child: Text('You have no favorite items yet.'),
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final favorite = favorites[index];
          return ListTile(
            leading: Image.network(favorite['image']),
            title: Text(favorite['title']),
            subtitle: Text('\$${favorite['price']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeFavorite(favorite['productId']);
              },
            ),
          );
        },
      ),
    );
  }
}