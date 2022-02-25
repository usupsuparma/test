import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:jangjo_customer/domain/repositories/point_repository.dart';

class GetPoint {
  final PointRepository pointRepository;
  GetPoint({required this.pointRepository});

  Future<Either<Failure, int>> execute() async {
    return await pointRepository.getPoint();
  }
}
