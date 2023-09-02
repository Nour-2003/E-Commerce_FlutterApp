import 'package:firebase_auth/firebase_auth.dart';
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
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final loadedFavorites = await DatabaseHelper.instance.getUserFavorites(userId);
      setState(() {
        favorites = loadedFavorites;
      });
    }
  }

  void _removeFavorite(int productId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      await DatabaseHelper.instance.deleteFavorite(userId, productId);
      _loadFavorites();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF22223B),
              Color(0xff4A4E69),
              Color(0xff9A8C98),
              Color(0xffC9ADA7),
              Color(0xffF2E9E4)
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
