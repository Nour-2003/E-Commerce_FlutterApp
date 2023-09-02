import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../DataBaseHelper.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;

  ProductDetailsPage({required this.product});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isFavorite = false;
  bool isAddedToCart = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
    _checkCartStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final isFav = await DatabaseHelper.instance.isFavorite(userId, widget.product['id']);
      setState(() {
        isFavorite = isFav;
      });
    }
  }

  Future<void> _checkCartStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final isCart = await DatabaseHelper.instance.isCartItem(userId, widget.product['id']);
      setState(() {
        isAddedToCart = isCart;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      if (isFavorite) {
        await DatabaseHelper.instance.deleteFavorite(userId, widget.product['id']);
      } else {
        await DatabaseHelper.instance.insertFavorite({
          'userId': userId,
          'productId': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'image': widget.product['images'][0],
        });
      }
      setState(() {
        isFavorite = !isFavorite;
      });
    }
  }

  Future<void> _addToCart() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      if (isAddedToCart) {
        await DatabaseHelper.instance.deleteCartItem(userId, widget.product['id']);
      } else {
        await DatabaseHelper.instance.insertCartItem({
          'userId': userId,
          'productId': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'image': widget.product['images'][0],
        });
      }
      setState(() {
        isAddedToCart = !isAddedToCart;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Product Details'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const SizedBox(height:50),
              Text(
                widget.product['category'],
                style:const TextStyle(fontSize: 16,
                 color: Color(0xffc9ada7)),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.product['images'][0],
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.product['title'],
                style: const TextStyle(
                  fontSize: 18,
                   fontWeight: FontWeight.bold,
                   color: Color(0xff22223b)
                   ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                widget.product['description'],
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '\$${widget.product["price"].toString()}',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                     color: Colors.yellow),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.product["rating"]} Stars',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _toggleFavorite,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isFavorite
                              ? Color(0xff22223b).withOpacity(0.1)
                              : Colors.grey.withOpacity(0.1),
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Color(0xff22223b) : null,
                          size: 20,
                        ),
                      ),
                    ),
                
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: _addToCart,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isAddedToCart
                          ? const Color(0xff22223b).withOpacity(0.1)
                          : Colors.grey.withOpacity(0.1),
                    ),
                    child: Icon(
                      isAddedToCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
                      color: isAddedToCart ? Color(0xff22223b): null,
                      size: 20,
                    ),
                  ),
                ),
                  ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
