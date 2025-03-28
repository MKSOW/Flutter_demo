import 'package:flutter/material.dart'; // utilisation des widgets de Material de l'interface mayerial disign
import 'package:provider/provider.dart'; //import du package provider pour la gestion des états
import 'providers/theme_provider.dart'; // import du fichier ou est defini le themeProvider qui gere le changement de theme
import 'views/home_page.dart'; // import du contient l'ecran principal de l'application

void main() { // point d'entrée de l'application
  runApp( // demarrage de l'application
    ChangeNotifierProvider( // provider qui permet de gerer l'etat du theme provider dans toute l'application
      create: (context) => ThemeProvider(), // creation de l'instance themeProvider qui sera accessible dans toute l'application
      child: const MyApp(), // l'application est un widget de type MyApp 
    ),
  );
}

class MyApp extends StatelessWidget { // la classe MyApp est un widget de type StatelessWidget(sans etat)
  const MyApp({super.key}); // constructeur de la classe MyApp

  @override // assure que la classe enfant modifie la methode build de la classe parent
  Widget build(BuildContext context) { //creation de la methode build qui retourne un widget
    final themeProvider = Provider.of<ThemeProvider>(context); // recuperation des themes (clair ou sombre)

    return MaterialApp( // et en fin nous retournons un widget de type MaterialApp
      debugShowCheckedModeBanner: false, // desactivation de la banniere de debogage
      theme: ThemeData.light(), // theme clair
      darkTheme: ThemeData.dark(), // theme sombre
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light, // si isDarkMode est vrai alors le theme est sombre sinon il est clair
      home: const HomePage(), // ecran principal de l'application
    );
  }
}
