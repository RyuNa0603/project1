import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project1/functions/api.dart';
import 'package:project1/models/athors_id_model.dart';
import 'package:project1/models/authors_model.dart';

class AuthorsRepo {
  Future<List<AuthorsModel>> getAuthors() async {
    try {
      final response = await http.get(Uri.parse(Api.authors));

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final List<AuthorsModel> authors =
            (data as List).map((e) => AuthorsModel.fromJson(e)).toList();
        return authors;
      }

      throw Exception(data['detail'].toString());
    } catch (e, s) {
      print('Error: $e');
      print('Error: $s');
      rethrow;
    }
  }

  Future<AuthorsIdModel> getAuthorById(int id) async {
    try {
      final response = await http.get(Uri.parse('${Api.authors}/$id'));

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return AuthorsIdModel.fromJson(data);
      }

      throw Exception(data['detail'].toString());
    } catch (e, s) {
      print('Error: $e');
      print('Error: $s');
      rethrow;
    }
  }
}
