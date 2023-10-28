import 'package:flutter/material.dart';
import 'package:rent_a_bike/constants/assets.dart';
import 'package:rent_a_bike/constants/colors.dart';
import 'package:rent_a_bike/constants/styles.dart';
import 'package:rent_a_bike/widgets/global/app_bar.dart';

class CheckOutPage extends StatefulWidget {
  static const id = '/checkout';
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final couponController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: customAppBar('Check Out'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MyColors.grey3,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    dateCard("Start Date", "09-06-2021"),
                    const SizedBox(height: 10),
                    dateCard("End Date", "12-06-2021"),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: couponController,
                keyboardType: TextInputType.text,
                style: MyStyles.h3Normal,
                decoration: InputDecoration(
                  hintText: "Apply coupon",
                  hintStyle: MyStyles.h3Normal.copyWith(color: MyColors.grey3),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: MyColors.grey3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: MyColors.grey3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: MyColors.grey3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: MyColors.grey3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text("Details", style: MyStyles.h2),
              const Divider(color: MyColors.grey3, height: 2),
              const SizedBox(height: 20),
              detailRow(title: "Days", value: "4"),
              detailRow(title: "Rent", value: "5996", isMoney: true),
              detailRow(title: "Additonal items", value: "6400", isMoney: true),
              detailRow(title: "Coupon discount", value: "396", isMoney: true),
              const SizedBox(height: 10),
              const Divider(color: MyColors.grey3, height: 2),
              const SizedBox(height: 10),
              detailRow(
                  title: "Total Amount",
                  value: "12000",
                  isMoney: true,
                  bold: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.blackColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "PAY",
            style: MyStyles.h1.copyWith(color: MyColors.whiteColor),
          ),
        ),
      ),
    );
  }

  Row detailRow({
    required String title,
    required String value,
    bool isMoney = false,
    bool bold = false,
  }) {
    final finalValue = isMoney ? '₹ $value' : value;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: bold ? MyStyles.h3 : MyStyles.h3Normal),
        Text(finalValue, style: bold ? MyStyles.h3 : MyStyles.h3Normal)
      ],
    );
  }

  Container dateCard(String title, String date) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.grey2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: MyStyles.h3Normal.copyWith(color: MyColors.grey3),
              ),
              Text(
                date,
                style: MyStyles.h3Normal,
              ),
            ],
          ),
          const SizedBox(width: 80),
          Image.asset(
            Assets.calendar,
            color: MyColors.blackColor,
            height: 30,
          ),
        ],
      ),
    );
  }
}
