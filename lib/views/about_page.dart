import 'package:flutter/material.dart';
import '../controllers/app_controller.dart';
import '../models/app_info.dart';

// declaration de la classe AboutPage qui est un widget de type StatelessWidget sans etet
//pour founir des details sur l'application 
class AboutPage extends StatelessWidget { 
  // on recuperer ici le constructeur qui gere la logique de recupration des données de l'applications
  final AppController controller = AppController();

  AboutPage({super.key});


  //Construction de l'interface utilisateur c'est a dire meme logique que les pages precedentes 
  @override
  Widget build(BuildContext context) {
    AppInfo appInfo = controller.fetchAppDetails(); // on a ici la methode de recuperation des details de l'application 

    return Scaffold(
      appBar: AppBar(title: const Text("À Propos")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              appInfo.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              appInfo.imagePath,  
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              appInfo.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
