import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/common/exception.dart';
import 'package:jangjo_customer/data/datasources/db/storage.dart';
import 'package:jangjo_customer/data/models/Point_history_model.dart';
import 'package:jangjo_customer/data/models/point_history_response.dart';

abstract class PointRemoteDatasource {
  Future<int> getPoint();
  Future<List<PointHistoryModel>> getPointHistory();
}

class PointRemoteDatasourceImpl extends PointRemoteDatasource {
  final http.Client client;
  final Storage storage;

  PointRemoteDatasourceImpl({required this.client, required this.storage});

  @override
  Future<int> getPoint() async {
    var token = await storage.getString(Storage.tokenKey);
    var customerId = await storage.getString(Storage.userIdKey);
    final url = Uri.parse('https://api.npoint.io/418b33f42fc43db99b8c');
    final msg = jsonEncode(
      {
        "payload": {"customerId": customerId}
      },
    );
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'X-Tenant': xTenant,
      },
      // body: msg,
    );

    try {
      if (response.statusCode == 200) {
        var head = response.headers;
        var body = jsonDecode(response.body);
        print(body);
        var result = body['result'];
        print(result);
        if (result['status'] == 'OK') {
          // var token = head['th-jwttask'];
          return result['point'];
          // return LoginResponse.fromJson(body, token).result;
        } else {
          // handle gagal login
          throw ServerException();
        }
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<PointHistoryModel>> getPointHistory() async {
    var token = await storage.getString(Storage.tokenKey);
    var customerId = await storage.getString(Storage.userIdKey);
    final url = Uri.parse('https://api.npoint.io/914f18253e09bb2abd43');
    final msg = jsonEncode(
      {
        "payload": {"customerId": customerId}
      },
    );
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'X-Tenant': xTenant,
      },
      // body: msg,
    );

    try {
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var result = body['result'];
        if (result['status'] == 'OK') {
          var res = PointHistoryResponse.fromJson(body).result;
          return res.pointHistory;
        } else {
          // handle gagal login
          throw ServerException();
        }
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }
}
