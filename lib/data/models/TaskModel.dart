import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  const TaskModel({
    required this.moduleId,
    required this.name,
    required this.type,
    required this.alwaysAllow,
  });

  final int moduleId;
  final String name;
  final String type;
  final String alwaysAllow;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        moduleId: json["moduleId"],
        name: json["name"],
        type: json["type"],
        alwaysAllow: json["alwaysAllow"],
      );

  Map<String, dynamic> toJson() => {
        "moduleId": moduleId,
        "name": name,
        "type": type,
        "alwaysAllow": alwaysAllow,
      };

  @override
  List<Object?> get props => [
        moduleId,
        name,
        type,
        alwaysAllow,
      ];
}
