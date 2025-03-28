import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// gestion du theme sombre de l'application 
class ThemeProvider with ChangeNotifier { // ici nous avons notre class ThemeProvider ChangeNotifier (ecoute les changement et notifie les widgets)
  bool _isDarkMode = false; 

  bool get isDarkMode => _isDarkMode; // acceder a l'etat actul du theme pour

  ThemeProvider() { // charger la preferenvce du theme enregistrer par le user l'utilisateur depuis  SharedPreferences
    _loadTheme();
  }

  void toggleTheme() { // basculer l'etat du theme 
    _isDarkMode = !_isDarkMode;
    _saveTheme();
    notifyListeners(); // notifier les widgets 
  }

  Future<void> _loadTheme() async { // ici on va charger la preference de theme de l'utilisateur lorqu'on lance l'application
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('darkMode') ?? false; 
    notifyListeners();
  }

  Future<void> _saveTheme() async { // enregistre la preference de theme themes 
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', _isDarkMode);
  }
}
