import 'package:jangjo_customer/domain/entities/point.dart';

class PointHistoryModel {
  PointHistoryModel({
    required this.date,
    required this.type,
    required this.point,
  });

  final String date;
  final String type;
  final int point;

  factory PointHistoryModel.fromJson(Map<String, dynamic> json) =>
      PointHistoryModel(
        date: json["date"],
        type: json["type"],
        point: json["point"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "type": type,
        "point": point,
      };

  Point toEntity() {
    return Point(date: date, point: point, type: type);
  }
}
