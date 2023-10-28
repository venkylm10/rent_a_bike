import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_a_bike/constants/colors.dart';
import 'package:rent_a_bike/pages/home/home.dart';
import 'package:rent_a_bike/routes.dart';

final navigatorkey = GlobalKey<NavigatorState>();
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      debugShowCheckedModeBanner: false,
      title: 'Rent a Bike',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: MyColors.grey3,
          selectionHandleColor: MyColors.grey3,
          selectionColor: MyColors.grey2.withOpacity(
            0.4,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
