import 'package:jangjo_customer/common/exception.dart';
import 'package:jangjo_customer/data/datasources/db/storage.dart';
import 'package:jangjo_customer/domain/entities/session.dart';

abstract class AuthLocalDataSource {
  Future<void> createSession(Session session);

  Future<Session> getSession();

  Future<String> getToken();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final Storage storage;

  AuthLocalDataSourceImpl({required this.storage});

  @override
  Future<void> createSession(Session session) async {
    try {
      await storage.setString(Storage.userIdKey, session.userId.toString());
      await storage.setString(Storage.fullnameKey, session.fullname);
      await storage.setString(Storage.tenantId, session.tenantId.toString());
      await storage.setString(Storage.secureKey, session.secureKey);
      await storage.setString(
          Storage.roleDefaultIdKey, session.roleDefaultId.toString());
      await storage.setString(Storage.tenantNameKey, session.tenantName);
      await storage.setString(Storage.tenantKey, session.tenantKey);
      await storage.setString(Storage.tokenKey, session.token);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<Session> getSession() async {
    // await storage.deleteAll();
    var _id = await storage.getString(Storage.userIdKey);
    var session = Session(
        userId: int.parse(_id),
        fullname: await storage.getString(Storage.fullnameKey),
        tenantId: int.parse(await storage.getString(Storage.tenantId)),
        secureKey: await storage.getString(Storage.secureKey),
        roleDefaultId:
            int.parse(await storage.getString(Storage.roleDefaultIdKey)),
        tenantName: await storage.getString(Storage.tenantNameKey),
        tenantKey: await storage.getString(Storage.tenantKey),
        token: await storage.getString(Storage.tokenKey));
    return session;
  }

  @override
  Future<String> getToken() async {
    var token = await storage.getString(Storage.tokenKey);
    return token;
  }
}
