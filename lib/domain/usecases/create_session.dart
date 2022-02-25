import 'package:jangjo_customer/domain/entities/session.dart';
import 'package:jangjo_customer/domain/repositories/auth_repositories.dart';

class CreateSession {
  final AuthRepository authRepository;
  CreateSession(this.authRepository);

  Future<void> execute(Session session) async {
    await authRepository.createSession(session);
  }
}
