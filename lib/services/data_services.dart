import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_review_film/dto/news.dart';
import 'package:app_review_film/endpoints/endpoints.dart';



class DataService {
  static Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(Endpoints.news));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => News.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}