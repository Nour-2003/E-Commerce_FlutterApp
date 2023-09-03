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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF22223B),
                Color(0xff4A4E69),
                Color(0xff9A8C98),
                Color(0xffC9ADA7),
                Color(0xffF2E9E4),
              ],
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Cart'),
            Text(
              'Total: \$${calculateTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // Center the content vertically
        children: [
          if (cartItems.isEmpty) // Show the message when cart is empty
            Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          if (cartItems.isNotEmpty) // Show the cart items if not empty
            Expanded(
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
          if (cartItems
              .isNotEmpty) // Show the button only if the cart is not empty
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // You can add your checkout logic here
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Checkout Confirmation'),
                        content: Text(
                            'Are you sure you want to proceed with the checkout?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Add logic to complete the checkout
                            },
                            child: Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary:
                      Color(0xff4A4E69), // Change the button color as desired
                ),
              ),
            ),
        ],
      ),
    );
  }
}
