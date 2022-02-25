import 'dart:io';

import 'package:jangjo_customer/common/exception.dart';
import 'package:jangjo_customer/data/datasources/auth_local_data_source.dart';
import 'package:jangjo_customer/data/datasources/auth_remote_data_source.dart';
import 'package:jangjo_customer/domain/entities/session.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/domain/repositories/auth_repositories.dart';

class AuthRepositoryImpl extends AuthRepository {
  late final AuthRemoteDataSource remoteDataSource;
  late final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, Session>> login(
      String username, String password) async {
    try {
      final result = await remoteDataSource.login(username, password);
      var ses = Session(
        userId: result.userId,
        fullname: result.fullName,
        tenantId: result.tenantId,
        secureKey: result.secureKey,
        roleDefaultId: result.roleDefaultId,
        tenantName: result.tenantName,
        tenantKey: result.tenantKey,
        token: result.token,
      );
      return Right(ses);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<void> createSession(Session session) async {
    await localDataSource.createSession(session);
  }

  @override
  Future<Session> getSession() async {
    try {
      var res = await localDataSource.getSession();
      return res;
    } on ServerException {
      throw ServerFailure('');
    } on SocketException {
      throw ConnectionFailure('Failed to connect to the network');
    }
  }

  @override
  Future<Either<Failure, Session>> fetchSession() async {
    try {
      var res = await localDataSource.getSession();
      return right(res);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      var res = await localDataSource.getToken();
      return right(res);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
