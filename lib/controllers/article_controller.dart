import 'dart:convert';

import '../models/article.dart';
import 'package:http/http.dart' as http;

class ArticleController {
  //ajouter la methode de scroll

  static const int articlesPerPage = 10; // Nombre d'articles par page

  static Future<List<Article>> fetchArticles(int page) async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=$articlesPerPage'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Erreur de chargement des articles');
    }
  }
}
