import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models.dart';

class ApiService {
  final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Data>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Data.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}