import 'package:flutter/material.dart';
import '../models/article.dart';
  //on va afficher le detail d'un article
class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  //Construction de l'interface utilisateur
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Text(article.body),
      ),
    );
  }
}
