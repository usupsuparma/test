import 'dart:math';

import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/common/exception.dart';
import 'package:jangjo_customer/data/models/login_response.dart';
import 'package:jangjo_customer/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jaguar_jwt/jaguar_jwt.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);
  Future<String> register(
      String name, String noHp, String email, String password);
}

class AuthDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthDataSourceImpl({required this.client});
  @override
  Future<UserModel> login(String username, String password) async {
    String randomJTI() {
      var _chars = "abcdefghijklmnopqrstuvwxyz0123456789";
      Random _rnd = Random();

      return String.fromCharCodes(
        Iterable.generate(
          12,
          (_) => _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      );
    }

    final claimSet = JwtClaim(
      jwtId: randomJTI(),
      subject: "api.taskhub.id",
      issuer: clientId,
      audience: <String>["$baseUrl/api/v2/authenticate"],
      maxAge: const Duration(seconds: 30),
    );

    String token = issueJwtHS256(claimSet, secretKey);
    try {
      final msg = jsonEncode({
        "payload": {"username": username, "password": password}
      });
      final url = Uri.parse('$baseUrl/api/v2/authenticate');
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'X-Tenant': xTenant,
        },
        body: msg,
      );
      if (response.statusCode == 200) {
        var head = response.headers;
        var body = jsonDecode(response.body);
        var result = body['result'];
        if (result['status'] == 'OK') {
          var token = head['th-jwttask'];
          return LoginResponse.fromJson(body, token).result;
        } else {
          // handle gagal login
          throw LoginError('Failed username or password');
        }
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> register(
      String name, String noHp, String email, String password) async {
    String randomJTI() {
      var _chars = "abcdefghijklmnopqrstuvwxyz0123456789";
      Random _rnd = Random();

      return String.fromCharCodes(
        Iterable.generate(
          12,
          (_) => _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      );
    }

    final claimSet = JwtClaim(
      jwtId: randomJTI(),
      subject: "api.taskhub.id",
      issuer: clientId,
      audience: <String>["$baseUrl/api/v2/authenticate"],
      maxAge: const Duration(seconds: 30),
    );

    String token = issueJwtHS256(claimSet, secretKey);
    try {
      final msg = jsonEncode({
        "payload": {
          "customerName": name,
          "password": password,
          "noHp": noHp,
          "email": email
        }
      });
      final url = Uri.parse('$baseUrl/api/v2/authenticate');
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'X-Tenant': xTenant,
        },
        body: msg,
      );
      if (response.statusCode == 200) {
        var head = response.headers;
        var body = jsonDecode(response.body);
        var result = body['result'];
        if (result['status'] == 'OK') {
          var token = head['th-jwttask'];
          // return LoginResponse.fromJson(body, token).result;
          var email = 'email';
          return email;
        } else {
          // handle gagal login
          throw LoginError('Failed username or password');
        }
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
