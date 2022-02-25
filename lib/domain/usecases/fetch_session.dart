import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:jangjo_customer/domain/entities/session.dart';
import 'package:jangjo_customer/domain/repositories/auth_repositories.dart';

class FetchSession {
  final AuthRepository repository;
  FetchSession({required this.repository});

  Future<Either<Failure, Session>> execute() async {
    return await repository.fetchSession();
  }
}
