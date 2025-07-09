import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project1/functions/api.dart';
import 'package:project1/models/category_model.dart';
import 'package:project1/models/vendors_model.dart';

class VendorsRepo {
  Future<List<CategoryModel>> getVendorCategories() async {
    try {
      final response = await http.get(Uri.parse(Api.vendorCategories));

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final List<CategoryModel> categories =
            (data as List).map((e) => CategoryModel.fromJson(e)).toList();
        return categories;
      }

      throw Exception(data['detail'].toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VendorModel>> getVendors({String? category}) async {
    final query = {'category': category ?? ''};
    try {
      final response = await http.get(
        Uri.parse(Api.vendors).replace(queryParameters: query),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final List<VendorModel> vendors =
            (data as List).map((e) => VendorModel.fromJson(e)).toList();
        return vendors;
      }

      throw Exception(data['detail'].toString());
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }
  }
}