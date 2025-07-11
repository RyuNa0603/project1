import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project1/models/book_model.dart';

class CartRepo {
  final String baseUrl = 'https://fastapi-books-app.onrender.com';
Future<String> addToCart({required int bookId, required int quantity}) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/cart/add'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "book_id": bookId,
        "quantity": quantity, // yuborishni unutmang!
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return data['msg'] ?? 'Added to cart';
    }
    throw Exception(data['detail'] ?? 'Failed to add');
  } catch (e) {
    rethrow;
  }
}


  Future<String> removeFromCart(int bookId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/cart/remove'),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"book_id": bookId}),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 204) {
        return data['msg'] ?? 'Removed from cart';
      }
      throw Exception(data['detail'] ?? 'Failed to remove');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BookModel>> getCartItems() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/cart/items'),
        headers: {
          'accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => BookModel.fromJson(item)).toList();
      }
      final error = jsonDecode(response.body);
      throw Exception(error['detail'] ?? 'Failed to load cart');
    } catch (e) {
      rethrow;
    }
  }

  getCart() {}
}
