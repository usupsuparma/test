import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:jangjo_customer/domain/entities/session.dart';
import 'package:jangjo_customer/domain/repositories/auth_repositories.dart';

class AuthLogin {
  final AuthRepository authRepository;
  AuthLogin(this.authRepository);

  Future<Either<Failure, Session>> execute(String username, String password) {
    var user = authRepository.login(username, password);
    // create session
    return user;
  }
}
