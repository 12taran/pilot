class UserResponse {
  final bool success;
  final User? user;

  UserResponse({
    required this.success,
    this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json['success'] ?? false,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'user': user?.toJson(),
      };
}

class User {
  final String? id;
  final String? fullname;
  final String? address;
  final String? phoneNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.fullname,
    this.address,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        fullname: json['fullname'],
        address: json['address'],
        phoneNumber: json['phoneNumber'],
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'fullname': fullname,
        'address': address,
        'phoneNumber': phoneNumber,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
