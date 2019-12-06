import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:shop/providers/product.dart';

class Products with ChangeNotifier {
  static const urlProducts =
      'https://flutter-update-eb0c0.firebaseio.com/products.json';

  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Future<void> fetchAndSetProducts() async {
    final response = await http.get(urlProducts);
    final data = json.decode(response.body) as Map<String, dynamic>;
    List<Product> _itemsTemp = [];
    data.forEach((key, value) {
      _itemsTemp.add(Product(
        description: value['description'],
        id: key,
        imageUrl: value['imageUrl'],
        price: value['price'],
        title: value['title'],
      ));
    });
    _items = _itemsTemp;
    notifyListeners();
  }

  List<Product> get favoritesItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  void updateProduct(String id, Product product) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    _items[prodIndex] = product;
    notifyListeners();
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    var response = await http.post(
      urlProducts,
      body: json.encode(
        {
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
        },
      ),
    );

    final newProduct = Product(
      id: json.decode(response.body)['name'],
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
      title: product.title,
    );
    _items.add(newProduct);
    notifyListeners();
  }
}
