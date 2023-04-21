import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/product.dart';

class HttpHandler {
  static const String _baseUrl = "dummyjson.com";

  static Future<List<Product>> fetchProducts() async {
    final uri = Uri.https(_baseUrl, "products");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['products'];
      return List<Product>.from(data.map((e) => Product.fromJson(e)));
    } else {
      throw Exception("Failed to fetch products");
    }
  }
}
