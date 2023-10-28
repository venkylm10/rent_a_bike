import 'package:flutter/material.dart';
import 'package:rent_a_bike/constants/assets.dart';
import 'package:rent_a_bike/constants/colors.dart';
import 'package:rent_a_bike/pages/home/tabs/home_tab.dart';
import 'package:rent_a_bike/pages/home/tabs/map_tab.dart';
import 'package:rent_a_bike/pages/home/tabs/settings_tab.dart';
import 'package:rent_a_bike/pages/home/tabs/wallet_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> tabs = const [
    HomeTab(),
    MapTab(),
    WalletTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      extendBodyBehindAppBar: true,
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 6,
        backgroundColor: MyColors.backgroundColor,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Image.asset(
              Assets.home,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'map',
            icon: Image.asset(
              Assets.map,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'wallet',
            icon: Image.asset(
              Assets.wallet,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'settings',
            icon: Image.asset(
              Assets.settings,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
