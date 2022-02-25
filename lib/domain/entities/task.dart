import 'package:equatable/equatable.dart';

class Task extends Equatable {
  Task({
    required this.moduleId,
    required this.name,
    required this.type,
    required this.alwaysAllow,
  });

  final int moduleId;
  final String name;
  final String type;
  final String alwaysAllow;

  @override
  List<Object?> get props => [
        moduleId,
        name,
        type,
        alwaysAllow,
      ];
}
