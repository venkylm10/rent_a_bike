import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_bike/constants/colors.dart';
import 'package:rent_a_bike/constants/styles.dart';
import 'package:rent_a_bike/main.dart';
import 'package:rent_a_bike/models/bike_model.dart';
import 'package:rent_a_bike/models/dummy_data.dart';
import 'package:rent_a_bike/pages/checkout/checkout.dart';
import 'package:rent_a_bike/widgets/global/app_bar.dart';

class BikeDetailsPage extends StatelessWidget {
  final BikeModel bike;
  const BikeDetailsPage({super.key, required this.bike});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar('Bike Details'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //details
              SizedBox(
                height: size.height * 0.46,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //specs
                    SizedBox(
                      width: size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            bike.company,
                            style: GoogleFonts.robotoSlab(
                              textStyle: MyStyles.h2Normal,
                            ),
                          ),
                          Text(
                            bike.series,
                            style: MyStyles.h2,
                          ),
                          const SizedBox(height: 20),
                          specCard('Category', bike.category),
                          const SizedBox(height: 20),
                          specCard('Displacement', '${bike.displacement} cc'),
                          const SizedBox(height: 20),
                          specCard('Max. Speed', '${bike.maxSpeed} km/h'),
                        ],
                      ),
                    ),

                    // image
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      width: size.width * 0.46,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: size.width * 0.1),
                            decoration: BoxDecoration(
                              color: MyColors.grey2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              bike.imagePath,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CheckOutPage(),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: MyColors.blackColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rent",
                                    style: MyStyles.h2.copyWith(
                                      color: MyColors.whiteColor,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '${bike.rent}/',
                                        style: GoogleFonts.risque(
                                          textStyle: MyStyles.h3Normal.copyWith(
                                            color: MyColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'per day',
                                        style: MyStyles.h3Normal.copyWith(
                                          color: MyColors.whiteColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // add items
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("Add", style: MyStyles.h2),
                  Text(" Items", style: MyStyles.h2Normal),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    List.generate(itemList.length, (index) => itemCard(index)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemCard(int index) {
    final item = itemList[index];
    bool added = item['added'];
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: MyColors.grey3,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 40,
                width: 60,
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(
                  item['image'],
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['name'],
                    style: MyStyles.h3.copyWith(height: 0.95),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${item['rent']}/',
                        style: GoogleFonts.risque(
                          textStyle: MyStyles.h3Normal,
                          height: 1,
                        ),
                      ),
                      Text(
                        'per day',
                        style: MyStyles.h3Normal.copyWith(
                          height: 1,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Container(
            constraints: const BoxConstraints(
              minWidth: 60,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: added ? MyColors.blackColor : MyColors.grey3,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              added ? "1" : "Add",
              textAlign: TextAlign.center,
              style: MyStyles.h4Normal.copyWith(
                color: added ? MyColors.whiteColor : MyColors.blackColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget specCard(String heading, String subHeading) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: MyColors.grey3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                heading,
                style: MyStyles.h4Normal.copyWith(color: MyColors.grey3),
              ),
              Text(subHeading, style: MyStyles.h4Normal)
            ],
          ),
        ],
      ),
    );
  }
}
