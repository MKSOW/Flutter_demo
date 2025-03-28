import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget { // on créé ici une page stateful car on utilise un controller pour les champs de saisie, et on va a des interaction utilisateur
  const ContactPage({super.key}); // constructeur de la classe ContactPage

  @override
  // ignore: library_private_types_in_public_api
  _ContactPageState createState() => _ContactPageState(); // creation d'un etat dynamique pour la classe ContactPage
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>(); // creation d'une cle globale key pour le formulaire
  final TextEditingController _nameController = TextEditingController(); // recuperation du texte saisi par l'utilisateur dans le champ nom
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() { // liberer les ressources et eviter les fuites de memoire
    _nameController.dispose(); // fermerture du controller
    _emailController.dispose();
    _messageController.dispose();
    super.dispose(); // et là on appel la methode dispose de la classe parent
  }

  Future<void> _sendEmail() async { // on appel cette methode pour envoyer l'email lorque l'utilisateur soumet le formulaire
  //recuperation de valeurs de saisie et les stoct dans des variables locales
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String message = _messageController.text;

    //verifier que les champs ne sont pas vides
    if (name.isNotEmpty && email.isNotEmpty && message.isNotEmpty) {
      //on créé ici une url pour ouvrir l'application email du client avec les informations saisies
      final Uri emailUri = Uri(
        scheme: 'mailto', // on va utiliser l'applicationde messagerie de l'utilisateieur
        path: email,
        queryParameters: {
          'subject': 'Message de Contact',
          'body': message,
        },
      );

      //ici on vab tenter l'ouverture de l'application email 
      if (await canLaunchUrl(emailUri)) { // canLaunchUrl: permet de verifier si l'application email est disponible
        await launchUrl(emailUri, mode: LaunchMode.externalApplication);
      } else {
        //l'application ne peu pas etre ouverte on envoi un message d'erreur explicatif.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Impossible d'ouvrir l'application email")),
        );
      }
    } else {
      //si tous les champs n'etais pas rempli en renvoi ce message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
    }
  }

  @override
  // creation de la methode build qui retourne un widget de type Scaffold
  // qui contion trois champs et un bouton pour envoyer le formulaire 
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // ajout de marges de 16px
        child: Form( // un widget qui permet de scructurer les champs de saisie 
          key: _formKey, // lz*a clé du form permet de valider et soumettre le formulaire
          child: Column(
            children: [
              TextFormField( // tous les champs sont des textFormField et prend constructeur et un validator 
                controller: _nameController, 
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  // verifier que le champ n'est pas vide
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(labelText: 'Message'),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un message';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                // declenchement de valiodation de l'envoi de l'email 
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //si le form est valid on appelke la methode _sendEmail
                    _sendEmail();
                  }
                },
                child: const Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
