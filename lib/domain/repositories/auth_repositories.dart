import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:jangjo_customer/domain/entities/session.dart';

abstract class AuthRepository {
  Future<Either<Failure, Session>> login(String username, String password);
  Future<void> createSession(Session session);

  Future<Session> getSession();

  Future<Either<Failure, Session>> fetchSession();

  Future<Either<Failure, String>> getToken();
}
