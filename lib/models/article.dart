// models de la classe article
class Article {
  final int id;
  final String title;
  final String body;

  Article({required this.id, required this.title, required this.body});

// on va creer icio un article a partir d'un objet json 
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}