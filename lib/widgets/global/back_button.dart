import 'package:flutter/material.dart';
import 'package:rent_a_bike/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      MyColors.grey2,
                      MyColors.whiteColor,
                    ],
                  )),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_rounded,
              color: MyColors.blackColor,
            ),
          )
        ],
      ),
    );
  }
}
