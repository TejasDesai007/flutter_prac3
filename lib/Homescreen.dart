import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Promotional Banner
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage("assets/images/banner.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Welcome Message
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Welcome to SoloZ!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "We offer a wide range of stylish and comfortable clothing for everyone.",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "🧥 Men's Collection: Trendy casuals, formal wear, and ethnic styles.\n"
                "👗 Women's Collection: Elegant dresses, tops, sarees, and more.\n"
                "🔥 Seasonal Sale: Exclusive discounts on top brands.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Shop now and upgrade your wardrobe with the latest fashion trends!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // Explore Button
            ],
          ),
        ),
      ],
    );
  }
}
