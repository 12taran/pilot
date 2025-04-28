class UserResponse {
  final bool? success;
  final User? user;

  UserResponse({
    this.success,
    this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json['success'] as bool?,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'user': user?.toJson(),
    };
  }
}

class User {
  final String? image;
  final String? id;
  final String? fullname;
  final String? address;
  final String? phoneNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  User({
    this.image,
    this.id,
    this.fullname,
    this.address,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      image: json['image'] as String?,
      id: json['_id'] as String?,
      fullname: json['fullname'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      '_id': id,
      'fullname': fullname,
      'address': address,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}
