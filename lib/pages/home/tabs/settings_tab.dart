import 'package:flutter/material.dart';
import 'package:rent_a_bike/constants/colors.dart';
import 'package:rent_a_bike/widgets/global/app_bar.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: customAppBar("Settings"),
    );
  }
}
