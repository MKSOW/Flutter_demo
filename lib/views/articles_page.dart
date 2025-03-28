import 'package:flutter/material.dart';
import '../controllers/article_controller.dart';
import '../models/article.dart';
import '../views/article_detail_page.dart';

class ArticlesPage extends StatefulWidget { 
  const ArticlesPage({super.key});

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  // declaration des variables 
  List<Article> articles = []; 
  int currentPage = 1;
  bool isLoading = false; 
  bool canLoadNextPage = true; 
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() { // on appel cette methode dés que l'etat du widget est initialisé
    super.initState();
    fetchMoreArticles(); // initState() a son appel ici  fetchMoreArticles() pour charger les articles
    _scrollController.addListener(_scrollListener);
  }

  Future<void> fetchMoreArticles() async {
    //fetchMoreArticles() est le resposensable de la recuperation des articles
    if (isLoading) return; // si isLoading est vrai on ne fait rien

    setState(() {
      isLoading = true; // on met a jour l'etat pour afficher un incateur de changement 
    });

    try {
      // on appel ici la method fetArticles du controlleur ArticleController pour recuperer les articles de la page courante
      List<Article> newArticles = await ArticleController.fetchArticles(currentPage);
      setState(() {
        articles.addAll(newArticles); 
        currentPage++;
        canLoadNextPage = newArticles.isNotEmpty; // Si la page retournée est vide, ne pas autoriser le chargement suivant
      });
    } catch (e) {
      print('Erreur: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  // ici on va ecouter le mouvement de defilement l'utilisateur pour charger plus d'articles si necessaire
  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      fetchMoreArticles();
    }
  }

  // methode pour charger la page suivante
  void goToNextPage() {
    if (canLoadNextPage) {
      fetchMoreArticles();
    }
  }

  //ArticleController
  void goToPreviousPage() {
    if (currentPage > 1) {  
      setState(() { 
        currentPage--; 
        articles.clear(); 
        fetchMoreArticles();
      });
    }
  }

  @override
  void dispose() { // liberer les ressources et eviter les fuites de memoire
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // principe de base de l'ecran 
    return Scaffold(
      appBar: AppBar(title: const Text('Articles')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(  
              // ListView.builder() affiche dynamiquement les articles 
              controller: _scrollController,
              itemCount: articles.length + 1,
              itemBuilder: (context, index) {
                if (index == articles.length) {
                  return isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox();
                }
                return ListTile(
                  title: Text(articles[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailPage(article: articles[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Ajout des boutons Précédent et Suivant
          Padding(
            padding: const EdgeInsets.all(8.0), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton( 
                  // ici nous allons avoir les deux boutons qui vont nous de navigeur entre les pages
                  onPressed: goToPreviousPage,
                  child: const Text('Précédent'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: goToNextPage,
                  child: const Text('Suivant'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
