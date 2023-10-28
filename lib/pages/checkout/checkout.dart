import 'package:flutter/material.dart';
import 'package:rent_a_bike/constants/assets.dart';
import 'package:rent_a_bike/constants/colors.dart';
import 'package:rent_a_bike/constants/styles.dart';
import 'package:rent_a_bike/widgets/global/app_bar.dart';

class CheckOutPage extends StatelessWidget {
  static const id = '/checkout';
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Check Out'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 400,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MyColors.grey3,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MyColors.grey2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Start Date",
                                style: MyStyles.h3Normal.copyWith(
                                  color: MyColors.grey3,
                                ),
                              ),
                              Text(
                                "09-06-2021",
                                style: MyStyles.h3Normal,
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Image.asset(
                            Assets.calendar,
                            color: MyColors.blackColor,
                            height: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
