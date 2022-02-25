import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:jangjo_customer/domain/entities/point.dart';
import 'package:jangjo_customer/domain/repositories/point_repository.dart';

class GetPointHistory {
  final PointRepository pointRepository;
  GetPointHistory({required this.pointRepository});

  Future<Either<Failure, List<Point>>> execute() async {
    return await pointRepository.getPointHistory();
  }
}
