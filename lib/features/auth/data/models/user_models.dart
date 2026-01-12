import 'package:blog_app/features/auth/domain/entities/user_entity.dart';

class UserModels extends UserEntity {
  UserModels({required super.id, required super.name, required super.email});

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
  );
}
