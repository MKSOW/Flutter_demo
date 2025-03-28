import 'package:b3_dev/providers/theme_provider.dart'; // import du fichier ou est defini le themeProvider qui gere le changement de theme
import 'package:b3_dev/views/articles_page.dart'; // import de la page Articles
import 'package:flutter/material.dart'; // import du package flutter
import 'second_page.dart'; // On importe la seconde page
import 'about_page.dart'; // Import de la page À Propos
import 'contact_page.dart'; //  Import de la page Contact
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget { // la classe HomePage est un widget de type StatelessWidget(sans etat)
  const HomePage({super.key}); // constructeur de la classe HomePage

  @override // assure que la classe enfant modifie la methode build de la classe parent
  Widget build(BuildContext context) { //creation de la methode build qui retourne un widget
    final themeProvider = Provider.of<ThemeProvider>(context); // recuperation des themes (clair ou sombre)
    

    return Container( // retourne un widget de type Container
      decoration: const BoxDecoration( // decoration du container
          gradient: LinearGradient( //Applique un dégradé de couleurs du coin supérieur gauche au coin inférieur droit.
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])), // sans succés 🤦‍♀️
              child: Scaffold( // contenair principal de la misen en page de l'application 
      appBar: AppBar(title: const Text("Accueil")), // barre d'en-tête de l'application
      drawer: Drawer( // ajout d'un principale de navigation avec plusieurs options
        child: ListView(
          children: [ // liste des options du menu (children plusieurs enfants)
            const DrawerHeader( // entête du menu
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile( 
              leading: const Icon(Icons.home), 
              title: const Text("Accueil"),
              onTap: () {
                Navigator.pop(context); // Ferme le Drawer
              },
            ),
            ListTile( //une option du menu
              leading: const Icon(Icons.pageview), //avec une icone
              title: const Text("Seconde Page"),
              onTap: () {
                Navigator.push( 
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
            ),
            ListTile(
        leading: const Icon(Icons.article),
        title: const Text('Articles'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArticlesPage()),
          );
        },
      ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("À Propos"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),

            ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Mode Sombre'),
            trailing: Switch( // un bouton qui permet de changer le theme de l'application
              value: themeProvider.isDarkMode, // Vérifie si le mode sombre est activé.
              onChanged: (value) { 
                themeProvider.toggleTheme(); // basculer entre mode sombre et mode clair
              },
            ),
          ),
          ],
        ),
      ),
      body: const Center( // corps de l'application
        child: Text(
          "Bienvenue sur l'Accueil !",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    )
    );
  }
}



