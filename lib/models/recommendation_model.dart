class Poi {
  final String name;
  final double lat;
  final double lon;
  final String category;

  Poi({
    required this.name,
    required this.lat,
    required this.lon,
    required this.category,
  });

  factory Poi.fromJson(Map<String, dynamic> json) {
    return Poi(
      name: json['name'],
      lat: json['location']['lat'],
      lon: json['location']['lon'],
      category: json['category'],
    );
  }
}
