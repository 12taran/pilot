class MemberResponse {
  final String? message;
  final bool? success;
  final List<Member>? data;

  MemberResponse({
    this.message,
    this.success,
    this.data,
  });

  factory MemberResponse.fromJson(Map<String, dynamic> json) {
    return MemberResponse(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => Member.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class Member {
  final String? id;
  final String? name;
  final String? designation;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Member({
    this.id,
    this.name,
    this.designation,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'designation': designation,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}
