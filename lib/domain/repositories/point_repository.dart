import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:jangjo_customer/domain/entities/point.dart';

abstract class PointRepository {
  Future<Either<Failure, int>> getPoint();
  Future<Either<Failure, List<Point>>> getPointHistory();
}
