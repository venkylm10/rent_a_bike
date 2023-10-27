class BikeModel {
  final String series;
  final String company;
  final String category;
  final int displacement;
  final int maxSpeed;
  final int rent;
  final String imagePath;
  final String thumbnailPath;
  final bool available;

  BikeModel({
    required this.series,
    required this.company,
    required this.category,
    required this.displacement,
    required this.maxSpeed,
    required this.rent,
    required this.imagePath,
    required this.available,
    required this.thumbnailPath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'series': series,
      'company': company,
      'category': category,
      'displacement': displacement,
      'maxSpeed': maxSpeed,
      'rent': rent,
      'imagePath': imagePath,
      'available': available,
      'thumbnailPath' : thumbnailPath,
    };
  }

  factory BikeModel.fromMap(Map<String, dynamic> map) {
    return BikeModel(
      series: map['series'] as String,
      company: map['company'] as String,
      category: map['category'] as String,
      displacement: map['displacement'] as int,
      maxSpeed: map['maxSpeed'] as int,
      rent: map['rent'] as int,
      imagePath: map['imagePath'] as String,
      available: map['available'] as bool,
      thumbnailPath: map['thumbnailPath'] as String,
    );
  }
}
