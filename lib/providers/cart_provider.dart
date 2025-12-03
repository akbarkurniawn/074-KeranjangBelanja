import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  /// TOTAL ITEM DI CART (qty dijumlah)
  int get cartCount {
    int total = 0;
    for (var item in _items) {
      total += (item['qty'] as int);
    }
    return total;
  }

  /// TAMBAH PRODUK KE CART
  void addToCart(Map<String, dynamic> product) {
    int index = _items.indexWhere((item) => item['name'] == product['name']);

    if (index != -1) {
      _items[index]['qty'] += 1; // tambah qty jika sudah ada
    } else {
      _items.add({
        'name': product['name'],
        'price': product['price'],
        'image': product['image'],
        'qty': 1,
      });
    }

    notifyListeners();
  }

  /// TAMBAH QTY
  void increaseQty(int index) {
    _items[index]['qty'] += 1;
    notifyListeners();
  }

  /// KURANGI QTY (hapus jika qty jadi 0)
  void decreaseQty(int index) {
    if (_items[index]['qty'] > 1) {
      _items[index]['qty'] -= 1;
    } else {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  /// TOTAL HARGA SEMUA PRODUK DI CART
  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      double price = _parsePrice(item['price']);
      total += price * (item['qty'] as int);
    }
    return total;
  }

  /// Helper: konversi "Rp15.000" menjadi 15000
  double _parsePrice(String price) {
    return double.tryParse(
          price.replaceAll("Rp", "").replaceAll(".", ""),
        ) ??
        0;
  }
}
