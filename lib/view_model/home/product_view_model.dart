import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/product.dart';
import '../../view_model/constants/constants.dart';


class HttpHandler{
  static Future<List<Product>> fetchProducts() async {
    try {
      final uri = Uri.https(baseUrl, "products");

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['products'];
        return List<Product>.from(data.map((e) => Product.fromJson(e)));
      } else {
        throw Exception("Failed to fetch products, response status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to fetch products, error message: $error");
    }
  }
}