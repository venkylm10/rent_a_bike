import 'package:flutter_riverpod/flutter_riverpod.dart';

final bikeTypeProvider =
    StateNotifierProvider<BikeTypes, int>((ref) => BikeTypes());

class BikeTypes extends StateNotifier<int> {
  BikeTypes() : super(1);
  final bikeTypes = [
    'Adventure',
    'Cruiser',
    'Sports',
    'Touring',
    'Road',
    'Chopper',
    'Dirt Bike',
  ];

  void updateSelected(int index) {
    state = index;
  }
}
