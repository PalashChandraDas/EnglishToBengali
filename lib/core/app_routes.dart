import 'package:get/get.dart';

import '../view/screens/bottom_nav/bottom_nav.dart';
import '../view/screens/splash_screen/splash_screen.dart';

class AppRoute {
  //======================== Init ======================

  static const String splashScreen = "/splash_screen";


  //======================== bottomNav ======================

  static const String bottomNav = "/bottom_nav";




  static List<GetPage> routes = [
    //======================== Init ======================

    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: bottomNav, page: () => const BottomNav()),
 ];
}
