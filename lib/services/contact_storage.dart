// import 'dart:convert';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

// class ContactStorage {
//   // Obtenir le chemin du fichier
//   Future<File> _getFile() async {
//     final directory = await getApplicationDocumentsDirectory();
//     return File('${directory.path}/contacts.json');
//   }

//   // Sauvegarder les contacts
//   Future<void> saveContacts(List<Map<String, String>> contacts) async {
//     final file = await _getFile();
//     String jsonContacts = jsonEncode(contacts);
//     await file.writeAsString(jsonContacts);
//   }

//   // Lire les contacts sauvegardés
//   Future<List<Map<String, String>>> loadContacts() async {
//     try {
//       final file = await _getFile();
//       if (!(await file.exists())) return [];
//       String jsonContacts = await file.readAsString();
//       List<dynamic> decoded = jsonDecode(jsonContacts);
//       return decoded.map((e) => Map<String, String>.from(e)).toList();
//     } catch (e) {
//       return [];
//     }
//   }
// }
