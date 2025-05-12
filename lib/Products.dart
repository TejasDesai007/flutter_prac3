import 'package:flutter/material.dart';
import 'productDetails.dart'; // Import the ProductDetailsScreen

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // Updated categories list with "All" instead of "Sale"
  final List<Map<String, String>> categories = [
    {"name": "All", "icon": "🌐"},
    {"name": "Men", "icon": "👕"},
    {"name": "Women", "icon": "👗"},
  ];

  final List<Map<String, String>> allProducts = [
    {
      "image": "assets/images/CasualShirt.jpg",
      "title": "Men's Casual Shirt",
      "price": "₹999",
      "category": "Men"
    },
    {
      "image": "assets/images/FormalShirt.jpg",
      "title": "Men's Formal Shirt",
      "price": "₹1,299",
      "category": "Men"
    },
    {
      "image": "assets/images/WomenDress.jpg",
      "title": "Elegant Women's Dress",
      "price": "₹1,599",
      "category": "Women"
    },
    {
      "image": "assets/images/Jeans.jpg",
      "title": "Women's Stylish Jeans",
      "price": "₹1,199",
      "category": "Women"
    },
    {
      "image": "assets/images/Hoodie.jpg",
      "title": "Hoodie Stylish",
      "price": "₹3,500",
      "category": "Men"
    },
    {
      "image": "assets/images/HalfShirt.jpg",
      "title": "Half Sleeve Shirt for Men",
      "price": "₹1,200",
      "category": "Men"
    }
  ];

  // Track the selected category
  String selectedCategory = "All";

  // Get products filtered by category
  List<Map<String, String>> get filteredProducts {
    if (selectedCategory == "All") {
      return allProducts; // Return all products when "All" is selected
    }
    return allProducts
        .where((product) => product["category"] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // "Explore Products" Title
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "Explore Products",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Category Selector (Centered)
          Center(
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: categories.map((category) {
                  bool isSelected = category["name"] == selectedCategory;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category["name"]!;
                        });
                      },
                      child: Chip(
                        label: Text(
                          "${category["icon"]} ${category["name"]}",
                          style: TextStyle(fontSize: 16),
                        ),
                        backgroundColor:
                            isSelected ? Colors.amber : Colors.black,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Clothing Products Grid
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75, // Adjusted for better view
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to ProductDetailsScreen and pass the selected product
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            product: filteredProducts[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.asset(
                              filteredProducts[index]["image"]!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 150,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              filteredProducts[index]["title"]!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              filteredProducts[index]["price"]!,
                              style: TextStyle(color: Colors.amber),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
