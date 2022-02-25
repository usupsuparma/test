import 'package:equatable/equatable.dart';

class Point extends Equatable {
  final String date;
  final String type;
  final int point;

  // ignore: prefer_const_constructors_in_immutables
  Point({required this.date, required this.point, required this.type});

  @override
  List<Object?> get props => [date, type, point];
}
