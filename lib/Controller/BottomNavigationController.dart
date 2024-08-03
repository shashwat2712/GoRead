import 'package:get/get.dart';
import '../Pages/HomePage/screens/HomePage.dart';
import '../Pages/SearchPage/screens/search_screen.dart';
import '../Pages/summarize_page.dart';
import '../reels/screens/reel_screen.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const HomePage(),
    const SearchPage(),
    const ReelScreen(),
  ];
}
