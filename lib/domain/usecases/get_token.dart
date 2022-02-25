import 'package:dartz/dartz.dart';
import 'package:jangjo_customer/common/failure.dart';
import 'package:jangjo_customer/domain/repositories/auth_repositories.dart';

class GetToken {
  final AuthRepository authRepository;
  GetToken({required this.authRepository});

  Future<Either<Failure, String>> execute() async {
    return await authRepository.getToken();
  }
}
