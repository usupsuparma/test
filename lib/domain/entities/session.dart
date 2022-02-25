import 'package:equatable/equatable.dart';

class Session extends Equatable {
  final int userId;
  final String fullname;
  final int tenantId;
  final String secureKey;
  final int roleDefaultId;
  final String tenantName;
  final String tenantKey;
  final String token;

  Session(
      {required this.userId,
      required this.fullname,
      required this.tenantId,
      required this.secureKey,
      required this.roleDefaultId,
      required this.tenantName,
      required this.tenantKey,
      required this.token});

  @override
  List<Object?> get props => [
        userId,
        fullname,
        tenantId,
        secureKey,
        roleDefaultId,
        tenantName,
        tenantKey
      ];
}
