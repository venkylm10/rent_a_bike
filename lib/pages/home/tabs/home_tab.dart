import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_bike/constants/assets.dart';
import 'package:rent_a_bike/constants/colors.dart';
import 'package:rent_a_bike/constants/styles.dart';
import 'package:rent_a_bike/globals/bike_types.dart';
import 'package:rent_a_bike/models/bike_model.dart';
import 'package:rent_a_bike/models/dummy_data.dart';

class HomeTab extends ConsumerWidget {
  static const id = '/home_tab';
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.read(bikeTypeProvider.notifier).bikeTypes;
    final selectedIndex = ref.watch(bikeTypeProvider);
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(width: 10),
            Image.asset(
              Assets.profilePic,
              height: 50,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: MyStyles.h5,
                  ),
                  Text(
                    "Abhi Tiwari",
                    style: MyStyles.h3.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            buildSearchBar(),
            const SizedBox(height: 20),
            buildBikeTypes(types, ref, selectedIndex),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    "Popular",
                    style: MyStyles.h2,
                  ),
                  Text(
                    ' Items',
                    style: MyStyles.h2Normal,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    popularBikes.length, (index) => popularBikeTile(index)),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Recently', style: MyStyles.h2),
                      Text(' viewed', style: MyStyles.h2Normal),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: List.generate(
                      recentBikes.length,
                      (index) => recentlyViewedBike(index),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget popularBikeTile(int index) {
    final populars = popularBikes.length;
    final bike = BikeModel.fromMap(popularBikes[index]);
    return Container(
      width: 160,
      height: 280,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(
          left: index == 0 ? 20 : 10, right: index == populars - 1 ? 20 : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: MyColors.grey3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              bike.thumbnailPath,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(bike.series, style: MyStyles.h2),
                Text(
                  bike.company,
                  style: MyStyles.h3Normal,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${bike.rent}/", style: MyStyles.h3),
                    Text(" per day", style: MyStyles.h3Normal),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildBikeTypes(List<String> types, WidgetRef ref, int selectedIndex) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          types.length,
          (index) => GestureDetector(
            onTap: () =>
                ref.read(bikeTypeProvider.notifier).updateSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 5).copyWith(
                left: index == 0 ? 20 : 5,
                right: index == types.length - 1 ? 20 : 0,
              ),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? MyColors.blackColor
                    : MyColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: MyColors.grey3,
                ),
              ),
              child: Text(
                types[index],
                style: MyStyles.h3.copyWith(
                  color: selectedIndex == index
                      ? MyColors.whiteColor
                      : MyColors.blackColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: MyColors.grey1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            size: 30,
            color: MyColors.grey3,
          ),
          Expanded(
              child: Center(
            child: Text(
              "Search Bike",
              style: MyStyles.h3.copyWith(
                color: MyColors.grey3,
                fontWeight: FontWeight.normal,
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget recentlyViewedBike(int index) {
    final bike = BikeModel.fromMap(recentBikes[index]);
    final available = bike.available;
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
                  vertical: 2,
                  horizontal: 2,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: MyColors.grey3,
                    )),
                child: Image.asset(
                  bike.imagePath,
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bike.series,
                    style: MyStyles.h3.copyWith(height: 0.95),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${bike.rent}/',
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
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: available ? MyColors.blackColor : MyColors.grey3,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              available ? "Available" : "Booked",
              style: MyStyles.h4Normal.copyWith(
                color: available ? MyColors.whiteColor : MyColors.blackColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
