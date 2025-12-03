import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'product_detail.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  final String category;

  ProductListScreen({required this.category});

  final Map<String, List<Map<String, String>>> data = {
    'Makanan': [
      {'name': 'Nasi Goreng Jawa', 'image': 'assets/images/nasi_goreng.jpg', 'price': 'Rp20.000'},
      {'name': 'Kwetiau Seafood', 'image': 'assets/images/kwetiau_goreng.jpeg', 'price': 'Rp23.000'},
      {'name': 'Ayam Goreng Lengkuas', 'image': 'assets/images/ayam_lengkuas.jpg', 'price': 'Rp20.000'},
      {'name': 'Sop Konro', 'image': 'assets/images/sop_konro.jpg', 'price': 'Rp45.000'},
    ],
    'Minuman': [
      {'name': 'Latte', 'image': 'assets/images/latte.jpg', 'price': 'Rp17.000'},
      {'name': 'Es Teh Manis', 'image': 'assets/images/es_teh.jpg', 'price': 'Rp8.000'},
      {'name': 'Jus Alpukat', 'image': 'assets/images/jus_alpukat.jpg', 'price': 'Rp17.000'},
      {'name': 'Milkshake Vanila', 'image': 'assets/images/milkshake.jpg', 'price': 'Rp15.000'},
    ],
    'Camilan': [
      {'name': 'Kentang Goreng', 'image': 'assets/images/kentang_goreng.jpg', 'price': 'Rp15.000'},
      {'name': 'Pisang Coklat Lumer', 'image': 'assets/images/pisang_goreng.jpg', 'price': 'Rp10.000'},
      {'name': 'Roti Bakar', 'image': 'assets/images/roti_bakar.jpeg', 'price': 'Rp15.000'},
      {'name': 'Tahu Walik', 'image': 'assets/images/tahu_walik.jpg', 'price': 'Rp13.000'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final products = data[category]!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          category,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),

        // ============================
        // 🔥 CART BUTTON + BADGE
        // ============================
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Consumer<CartProvider>(
              builder: (context, cart, child) {
                return Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CartScreen()),
                        );
                      },
                    ),

                    if (cart.cartCount > 0)
                      Positioned(
                        right: 4,
                        top: 5,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            cart.cartCount.toString(),
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3E2723),
              Color(0xFF5D4037),
              Color(0xFF8D6E63),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: GridView.builder(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.78,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
          ),

          itemBuilder: (context, index) {
            final p = products[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(product: p),
                  ),
                );
              },

              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(22),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              p['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 6),

                              Text(
                                p['name']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                p['price']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFF3D7A4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
