class PropertyModel {
  final String id;
  final String projectName;
  final List<String> images;
  final String address;
  final double latitude;
  final double longitude;
  final int price;
  final String type;
  final String description;
  final String createdAt;
  final String updatedAt;

  PropertyModel({
    required this.id,
    required this.projectName,
    required this.images,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.type,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      id: map['_id'] ?? '',
      projectName: map['projectName'] ?? '',
      images: List<String>.from(map['images'] ?? []),
      address: map['address'] ?? '',
         latitude: (map['latitude'] as num?)?.toDouble() ?? 0.0, // ✅ Null check with fallback value
      longitude: (map['longitude'] as num?)?.toDouble() ?? 0.0,
      price: map['price'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }
}
