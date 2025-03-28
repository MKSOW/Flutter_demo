import '../models/app_info.dart';

class AppController {
  //obtenir les details de l'application depuis la methode fetchAppDetails
  AppInfo fetchAppDetails() {
    return AppInfo.getAppDetails();
  }
}
