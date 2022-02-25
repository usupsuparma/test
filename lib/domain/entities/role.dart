import 'package:equatable/equatable.dart';

class Role extends Equatable {
  const Role({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
