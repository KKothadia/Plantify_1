import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EFD9), // light cream
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green.shade900,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFF4EFD9),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Plantify",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF388E3C), // secondary green
          letterSpacing: 1.2,
        ),
      ),
      IconButton(
        icon: const Icon(Icons.notifications_none, color: Color(0xFF388E3C)), // secondary green
        onPressed: () {},
      ),
    ],
  ),
),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Best Sellers",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8A5BC0), // Purple tone
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  buildProductCard(
                    imageUrl: 'https://images.unsplash.com/photo-1501004318641-b39e6451bec6',
                    name: 'Rose',
                    price: '\$5.6',
                  ),
                  const SizedBox(width: 16),
                  buildProductCard(
                    imageUrl: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb',
                    name: 'Brown Pot',
                    price: '\$12.5',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildProductCard({
    required String imageUrl,
    required String name,
    required String price,
  }) {
    return SizedBox(
      width: 150,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
