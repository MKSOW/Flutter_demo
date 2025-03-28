import '../models/contact_form.dart';
import 'package:flutter/material.dart';

class ContactController {
  void sendForm(BuildContext context, ContactForm form) {
    // Simule l'envoi du formulaire
    print("Nom: ${form.name}");
    print("Email: ${form.email}");
    print("Message: ${form.message}");

    // Affiche une SnackBar pour confirmer l'envoi
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Message envoyé avec succès !"),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
