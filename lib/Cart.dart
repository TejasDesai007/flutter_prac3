import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // List to hold cart items dynamically
  List<Map<String, String>> cartItems = [
    {
      "image": "assets/images/CasualShirt.jpg",
      "title": "Men's Casual Shirt",
      "price": "₹999",
      "quantity": "1"
    },
    {
      "image": "assets/images/FormalShirt.jpg",
      "title": "Men's Formal Shirt",
      "price": "₹1,299",
      "quantity": "2"
    },
    {
      "image": "assets/images/WomenDress.jpg",
      "title": "Elegant Women's Dress",
      "price": "₹1,599",
      "quantity": "1"
    },
  ];

  // Function to remove an item from the cart
  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  // Function to update the quantity of an item
  void updateQuantity(int index, String action) {
    setState(() {
      if (action == 'increase') {
        cartItems[index]['quantity'] =
            (int.parse(cartItems[index]['quantity']!) + 1).toString();
      } else if (action == 'decrease' &&
          int.parse(cartItems[index]['quantity']!) > 1) {
        cartItems[index]['quantity'] =
            (int.parse(cartItems[index]['quantity']!) - 1).toString();
      }
    });
  }

  // Function to calculate the total price
  double calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      // Remove commas from the price and parse it as double
      String priceStr = item['price']!
          .replaceAll(',', '')
          .substring(1); // Remove ₹ and commas
      total += double.parse(priceStr) * int.parse(item['quantity']!);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cart Title
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Your Cart",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Review your selected items before proceeding to checkout.",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),

        // Cart Items List
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          cartItems[index]["image"]!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 15),
                      // Product Details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItems[index]["title"]!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Price: ${cartItems[index]["price"]}"),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  updateQuantity(index, 'decrease');
                                },
                              ),
                              Text(cartItems[index]["quantity"]!),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  updateQuantity(index, 'increase');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      // Remove Button
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          removeItem(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Cart Total and Checkout
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Divider(thickness: 1),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₹${calculateTotal().toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Proceed to checkout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Amber background color
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Proceed to Checkout",
                  style: TextStyle(
                      fontSize: 16, color: Colors.amber), // Black text color
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
