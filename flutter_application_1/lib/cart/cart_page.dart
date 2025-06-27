import 'package:flutter/material.dart';
import 'checkout.dart';
import '../order.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(name: "Moisturizer", price: 15.99, quantity: 1),
    CartItem(name: "Cleanser", price: 12.99, quantity: 2),
    CartItem(name: "Sunscreen", price: 18.99, quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Color.fromRGBO(72, 52, 102, 1.0),
      ),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Cart items
          ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return CartItemWidget(
                item: cartItems[index],
                onIncrease: () {
                  setState(() {
                    cartItems[index] = CartItem(
                      name: cartItems[index].name,
                      price: cartItems[index].price,
                      quantity: cartItems[index].quantity + 1,
                    );
                  });
                },
                onDecrease: () {
                  setState(() {
                    if (cartItems[index].quantity > 1) {
                      cartItems[index] = CartItem(
                        name: cartItems[index].name,
                        price: cartItems[index].price,
                        quantity: cartItems[index].quantity - 1,
                      );
                    } else {
                      cartItems.removeAt(index);
                    }
                  });
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(72, 52, 102, 1.0).withOpacity(0.9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total: \$${calculateTotal().toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      cartItems: cartItems,
                      total: calculateTotal(),
                    ),
                  ),
                );
              },
              child: Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateTotal() {
    return cartItems.fold(
        0, (total, item) => total + (item.price * item.quantity));
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  CartItemWidget(
      {required this.item, required this.onIncrease, required this.onDecrease});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("\$${item.price.toStringAsFixed(2)}"),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: onDecrease,
                ),
                Text(item.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: onIncrease,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
