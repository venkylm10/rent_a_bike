// factory BikeModel.fromMap(Map<String, dynamic> map) {
//   return BikeModel(
//     series: map['series'] as String,
//     company: map['company'] as String,
//     category: map['category'] as String,
//     displacement: map['displacement'] as int,
//     maxSpeed: map['maxSpeed'] as int,
//     rent: map['rent'] as int,
//     imagePath: map['imagePath'] as String,
//     available: map['available'] as bool,
//   );
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Map<String, dynamic>> bikes = [
  {
    'series': 'Meteore',
    'company': 'Royal Enfield',
    'category': '',
    'displacement': 900,
    'maxSpeed': 124,
    'rent': 699,
    'imagePath': 'assets/images/bikes/meteore_royal_enfield.png',
    'thumbnailPath': 'assets/images/bikes/meteore_royal_enfield_thumbnail.png',
    'available': true,
  },
  {
    'series': 'Scout Bobber',
    'company': 'Indian',
    'category': 'Cruiser',
    'displacement': 1133,
    'maxSpeed': 124,
    'rent': 1499,
    'imagePath': 'assets/images/bikes/scout_bobber_indian.png',
    'thumbnailPath': 'assets/images/bikes/scout_bobber_indian_thumbnail.png',
    'available': true,
  },
  {
    'series': 'Hayabusa',
    'company': 'Suzuki',
    'category': 'Cruiser',
    'displacement': 1200,
    'maxSpeed': 200,
    'rent': 2000,
    'imagePath': 'assets/images/bikes/hayabusa_suzuki.png',
    'thumbnailPath': 'assets/images/bikes/hayabusa_suzuki_thumbnail.png',
    'available': true,
  },
];

final List<Map<String, dynamic>> popularBikes = [
  {
    'series': 'Meteore',
    'company': 'Royal Enfield',
    'category': 'Cruiser',
    'displacement': 900,
    'maxSpeed': 124,
    'rent': 699,
    'imagePath': 'assets/images/bikes/meteore_royal_enfield.png',
    'thumbnailPath': 'assets/images/bikes/meteore_royal_enfield_thumbnail.png',
    'available': true,
  },
  {
    'series': 'Scout Bobber',
    'company': 'Indian',
    'category': 'Cruiser',
    'displacement': 1133,
    'maxSpeed': 124,
    'rent': 1499,
    'imagePath': 'assets/images/bikes/scout_bobber_indian.png',
    'thumbnailPath': 'assets/images/bikes/scout_bobber_indian_thumbnail.png',
    'available': true,
  },
  {
    'series': 'Meteore',
    'company': 'Royal Enfield',
    'category': 'Cruiser',
    'displacement': 900,
    'maxSpeed': 124,
    'rent': 699,
    'imagePath': 'assets/images/bikes/meteore_royal_enfield.png',
    'thumbnailPath': 'assets/images/bikes/meteore_royal_enfield_thumbnail.png',
    'available': true,
  },
];

final List<Map<String, dynamic>> recentBikes = [
  {
    'series': 'Hayabusa',
    'company': 'Suzuki',
    'category': 'Cruiser',
    'displacement': 1200,
    'maxSpeed': 200,
    'rent': 2000,
    'imagePath': 'assets/images/bikes/hayabusa_suzuki.png',
    'thumbnailPath': 'assets/images/bikes/hayabusa_suzuki_thumbnail.png',
    'available': true,
  },
  {
    'series': 'Scout Bobber',
    'company': 'Indian',
    'category': 'Cruiser',
    'displacement': 1133,
    'maxSpeed': 124,
    'rent': 1499,
    'imagePath': 'assets/images/bikes/scout_bobber_indian.png',
    'thumbnailPath': 'assets/images/bikes/scout_bobber_indian_thumbnail.png',
    'available': true,
  },
  {
    'series': 'Meteore',
    'company': 'Royal Enfield',
    'category': '',
    'displacement': 900,
    'maxSpeed': 124,
    'rent': 699,
    'imagePath': 'assets/images/bikes/meteore_royal_enfield.png',
    'thumbnailPath': 'assets/images/bikes/meteore_royal_enfield_thumbnail.png',
    'available': false,
  },
];

final List<Map<String, dynamic>> itemList = [
  {
    'name': 'Riding Jacket',
    'rent': 800,
    'added': true,
    'image': 'assets/images/items/riding_jacket.png',
  },
  {
    'name': 'Riding Jacket',
    'rent': 800,
    'added': false,
    'image': 'assets/images/items/riding_gloves.png',
  },
  {
    'name': 'Riding Jacket',
    'rent': 800,
    'added': true,
    'image': 'assets/images/items/helmet.png',
  },
  {
    'name': 'Riding Jacket',
    'rent': 800,
    'added': false,
    'image': 'assets/images/items/riding_jacket.png',
  },
];

final itemsProvider = Provider((ref) => itemList);
