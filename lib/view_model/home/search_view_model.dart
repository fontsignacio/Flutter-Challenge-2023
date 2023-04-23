import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/product.dart';
import '../../view_model/constants/constants.dart';

class HttpSearch {
  static Future<List<Product>> fetchSearch(String query) async {
    try {
      final uri = Uri.https(baseUrl, "products/search", {'q': query});

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['products'];
        return List<Product>.from(data.map((e) => Product.fromJson(e)));
      } else {
        throw Exception("Failed to fetch products");
      }
    } catch (e) {
      throw Exception("Error occurred while fetching products: $e");
    }
  }
}