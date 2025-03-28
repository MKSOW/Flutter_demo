import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget { // meme logique que la classe HomePage c'est a dire un widget de type StatelessWidget sans etat
  const SecondPage({super.key}); // constructeur de la classe SecondPage

  @override
  // construction de la structure de base de l'application 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seconde Page")),
      body: const Center(
        child: Text(
          "Bienvenue sur la Seconde Page !",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
