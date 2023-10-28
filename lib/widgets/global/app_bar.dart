import 'package:flutter/material.dart';
import 'package:rent_a_bike/constants/colors.dart';
import 'package:rent_a_bike/constants/styles.dart';
import 'package:rent_a_bike/widgets/global/back_button.dart';

AppBar customAppBar(String title) {
  return AppBar(
    backgroundColor: MyColors.backgroundColor,
    leading: const CustomBackButton(),
    title: Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.grey3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: MyStyles.h2,
          ),
        ),
      ),
    ),
  );
}
