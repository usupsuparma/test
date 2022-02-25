import 'package:equatable/equatable.dart';

class RoleModel extends Equatable {
  const RoleModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
