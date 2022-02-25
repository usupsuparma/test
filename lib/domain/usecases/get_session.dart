import 'package:jangjo_customer/domain/entities/session.dart';
import 'package:jangjo_customer/domain/repositories/auth_repositories.dart';

class GetSession {
  final AuthRepository _authRepository;
  GetSession(this._authRepository);

  Future<Session> execute() {
    return _authRepository.getSession();
  }
}
