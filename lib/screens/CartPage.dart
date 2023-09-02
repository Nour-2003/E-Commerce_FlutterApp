import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../DataBaseHelper.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
    DatabaseHelper.instance.cartNotifier.addListener(_onCartChanged);
  }

  @override
  void dispose() {
    DatabaseHelper.instance.cartNotifier.removeListener(_onCartChanged);
    super.dispose();
  }

  void _onCartChanged() {
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final loadedCartItems = await DatabaseHelper.instance.getUserCart(userId);
      setState(() {
        cartItems = loadedCartItems;
      });
    }
  }

  void _removeCartItem(int productId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      await DatabaseHelper.instance.deleteCartItem(userId, productId);
      _loadCartItems();
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (final cartItem in cartItems) {
      totalPrice += cartItem['price'];
    }
    return totalPrice;
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
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          cartItems.isEmpty
              ? Center(
            child: Text('Your cart is empty.'),
          )
              : Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  leading: Image.network(cartItem['image']),
                  title: Text(cartItem['title']),
                  subtitle: Text('\$${cartItem['price']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _removeCartItem(cartItem['productId']);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
