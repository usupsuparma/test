import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:jangjo_customer/domain/entities/reward.dart';
import 'package:jangjo_customer/domain/repositories/reward_repository.dart';

class GetRewards {
  final RewardRepository rewardRepository;
  GetRewards({required this.rewardRepository});

  Future<Either<Failure, List<Reward>>> execute() async {
    return await rewardRepository.getReward();
  }
}
