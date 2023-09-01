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

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final isFav = await DatabaseHelper.instance.isFavorite(widget.product['id']);
    setState(() {
      isFavorite = isFav;
    });
  }

  Future<void> _toggleFavorite() async {
    if (isFavorite) {
      await DatabaseHelper.instance.deleteFavorite(widget.product['id']);
    } else {
      await DatabaseHelper.instance.insertFavorite({
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.product['category'],
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        Image.network(
                          widget.product['images'][0],
                          height: 200,
                          width: 200,
                        ),
                        SizedBox(height: 16),
                        Text(
                          widget.product['title'],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.product['description'],
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$${widget.product["price"].toString()}',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4),
                            Text(
                              '${widget.product["rating"]} Stars',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: (20 / 375.0) * MediaQuery.of(context).size.width,
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              (8 / 375.0) * MediaQuery.of(context).size.width),
                          width: (36 / 375.0) * MediaQuery.of(context).size.width,
                          height: (36 / 375.0) * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color:
                            const Color(0xFF979797).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: _toggleFavorite,
                            child: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}