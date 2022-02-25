import 'package:equatable/equatable.dart';
import 'package:jangjo_customer/domain/entities/role.dart';
import 'package:jangjo_customer/domain/entities/task.dart';

class User extends Equatable {
  const User({
    required this.userId,
    required this.fullName,
    required this.tenantId,
    required this.secureKey,
    required this.roleDefaultId,
    required this.tenantName,
    required this.tenantKey,
    required this.roles,
    required this.tasks,
    required this.realms,
    required this.requiresPasswordChange,
    required this.passwordExpiredDatetime,
    required this.auditReportActive,
    required this.status,
  });

  final int userId;
  final String fullName;
  final int tenantId;
  final String secureKey;
  final int roleDefaultId;
  final String tenantName;
  final String tenantKey;
  final List<Role> roles;
  final List<Task> tasks;
  final List<dynamic> realms;
  final String requiresPasswordChange;
  final String passwordExpiredDatetime;
  final String auditReportActive;
  final String status;

  @override
  List<Object?> get props => [
        userId,
        fullName,
        tenantId,
        secureKey,
        roleDefaultId,
        tenantName,
        tenantKey,
        roles,
        tasks,
        realms,
        requiresPasswordChange,
        passwordExpiredDatetime,
        auditReportActive,
        status,
      ];
}
