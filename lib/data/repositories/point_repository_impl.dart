import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/common/exception.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:jangjo_customer/data/datasources/point_remote_data_source.dart';
import 'package:jangjo_customer/domain/entities/point.dart';
import 'package:jangjo_customer/domain/repositories/point_repository.dart';

class PointRepositoryImpl extends PointRepository {
  final PointRemoteDatasource pointRemoteDatasource;
  PointRepositoryImpl({required this.pointRemoteDatasource});
  @override
  Future<Either<Failure, int>> getPoint() async {
    try {
      final result = await pointRemoteDatasource.getPoint();
      return right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Point>>> getPointHistory() async {
    try {
      final result = await pointRemoteDatasource.getPointHistory();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
