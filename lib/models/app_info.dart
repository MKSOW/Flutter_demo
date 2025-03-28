// details de l'application 
class AppInfo {
  final String title;
  final String description;
  final String imagePath;

  AppInfo({
    required this.title,
    required this.description,
    required this.imagePath,
  });


// la methode pour retourner des valeurs par defaut pour chaque propriété du model.
  static AppInfo getAppDetails() {
    return AppInfo(
      title: "Bienvenue dans mon application Flutter ! 🎉",
      description: "Cette application a été développée par MAMADOU pour apprendre Flutter en suivant l'architecture MVC.",
      imagePath: "assets/images/background.jpg",
    );
  }
}
