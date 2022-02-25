import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:jangjo_customer/domain/entities/reward.dart';

abstract class RewardRepository {
  Future<Either<Failure, List<Reward>>> getReward();
}
