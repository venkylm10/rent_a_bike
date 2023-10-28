import 'package:rent_a_bike/pages/checkout/checkout.dart';
import 'package:rent_a_bike/pages/home/home.dart';
import 'package:rent_a_bike/pages/home/tabs/home_tab.dart';

final routes = {
  HomePage.id: (context) => const HomePage(),
  HomeTab.id: (context) => HomeTab(),
  CheckOutPage.id: (context) => const CheckOutPage(),
};
