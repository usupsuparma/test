import 'dart:io';

import 'package:jangjo_customer/common/exception.dart';
import 'package:jangjo_customer/data/datasources/reward_remote_data.source.dart';
import 'package:jangjo_customer/domain/entities/reward.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/domain/repositories/reward_repository.dart';

class RewardRepositoryImpl extends RewardRepository {
  final RewardRemoteDatasource remoteDatasource;

  RewardRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Reward>>> getReward() async {
    try {
      final result = await remoteDatasource.getReward();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
