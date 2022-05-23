import 'package:get/get.dart';

import '../../home_screen.dart';
import '../../splash_screen.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),

    GetPage(name: '/home', page: () => HomeScreen()),
    //GetPage(name: '/settings', page: () => SettingsUI()),
    //GetPage(name: '/update-profile', page: () => UpdateProfileUI()),
  ];
}
