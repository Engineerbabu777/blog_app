import 'package:blog_app/core/common/entities/user_entity.dart';

class UserModels extends UserEntity {
  UserModels({required super.id, required super.name, required super.email});

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
  );

  UserModels copyWith({String? id, String? name, String? email}) {
    return UserModels(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
