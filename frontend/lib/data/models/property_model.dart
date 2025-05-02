class PropertyModel {
  final String name;

  final String image;
  final String location;
  final double latitude;
  final double longitude;
  final String price;
  final String type;
  final String description;

  PropertyModel({
    required this.name,
  
    required this.image,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.type,
    required this.description,
  });

  // Factory constructor to create PropertyModel from Map
  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      name: map['projectName'] ?? '',
    
      image: map['images'] ?? '',
      location: map['address'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      price: map['price'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
    );
  }

  // To convert PropertyModel back to Map
  Map<String, dynamic> toMap() {
    return {
      'projectName': name,
      
      'images': image,
      'address': location,
      'latitude': latitude,
      'longitude': longitude,
      'price': price,
      'type': type,
      'description': description,
    };
  }
}
