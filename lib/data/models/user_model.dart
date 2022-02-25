import 'package:equatable/equatable.dart';
import 'package:jangjo_customer/data/models/TaskModel.dart';
import 'package:jangjo_customer/data/models/role_model.dart';
import 'package:jangjo_customer/domain/entities/role.dart';
import 'package:jangjo_customer/domain/entities/task.dart';
import 'package:jangjo_customer/domain/entities/user.dart';

class UserModel extends Equatable {
  UserModel({
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
    required this.token,
  });

  final int userId;
  final String fullName;
  final int tenantId;
  final String secureKey;
  final int roleDefaultId;
  final String tenantName;
  final String tenantKey;
  final List<RoleModel> roles;
  final List<TaskModel> tasks;
  final List<dynamic> realms;
  final String requiresPasswordChange;
  final String passwordExpiredDatetime;
  final String auditReportActive;
  final String status;
  final String token;

  factory UserModel.fromJson(Map<String, dynamic> json, String? token) =>
      UserModel(
        userId: json["userId"],
        fullName: json["fullName"],
        tenantId: json["tenantId"],
        secureKey: json["secureKey"],
        roleDefaultId: json["roleDefaultId"],
        tenantName: json["tenantName"],
        tenantKey: json["tenantKey"],
        roles: List<RoleModel>.from(
            json["roles"].map((x) => RoleModel.fromJson(x))),
        tasks: List<TaskModel>.from(
            json["tasks"].map((x) => TaskModel.fromJson(x))),
        realms: List<dynamic>.from(json["realms"].map((x) => x)),
        requiresPasswordChange: json["requiresPasswordChange"],
        passwordExpiredDatetime: json["passwordExpiredDatetime"],
        auditReportActive: json["auditReportActive"],
        status: json["status"],
        token: token ?? '',
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "tenantId": tenantId,
        "secureKey": secureKey,
        "roleDefaultId": roleDefaultId,
        "tenantName": tenantName,
        "tenantKey": tenantKey,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
        "realms": List<dynamic>.from(realms.map((x) => x)),
        "requiresPasswordChange": requiresPasswordChange,
        "passwordExpiredDatetime": passwordExpiredDatetime,
        "auditReportActive": auditReportActive,
        "status": status,
      };

  User toEntity() {
    List<Role> _roles = [];
    List<Task> _tasks = [];
    roles.map((e) => {_roles.add(Role(id: e.id, name: e.name))});
    tasks.map((i) => {
          _tasks.add(Task(
              moduleId: i.moduleId,
              name: i.name,
              type: i.type,
              alwaysAllow: i.alwaysAllow))
        });
    return User(
        userId: userId,
        fullName: fullName,
        tenantId: tenantId,
        secureKey: secureKey,
        roleDefaultId: roleDefaultId,
        tenantName: tenantName,
        tenantKey: tenantKey,
        roles: _roles,
        tasks: _tasks,
        realms: realms,
        requiresPasswordChange: requiresPasswordChange,
        passwordExpiredDatetime: passwordExpiredDatetime,
        auditReportActive: auditReportActive,
        status: status);
  }

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
