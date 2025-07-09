import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project1/functions/api.dart';
import 'package:project1/models/category_model.dart';

class CategoryRepo {
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse("${Api.baseUrl}${Api.categories}"),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final categories = (data as List)
            .map(
              (e) => CategoryModel.fromJson(e),
            )
            .toList();
        return categories;
      }
      throw Exception(data['detail'] ?? '');
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
