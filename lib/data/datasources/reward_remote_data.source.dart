import 'dart:convert';

import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/common/exception.dart';
import 'package:jangjo_customer/data/datasources/db/storage.dart';
import 'package:jangjo_customer/data/models/reward_model.dart';
import 'package:http/http.dart' as http;
import 'package:jangjo_customer/data/models/reward_response.dart';

abstract class RewardRemoteDatasource {
  Future<List<RewardModel>> getReward();
}

class RewardRemoteDatasourceImpl extends RewardRemoteDatasource {
  final http.Client client;
  final Storage storage;

  RewardRemoteDatasourceImpl({required this.client, required this.storage});

  @override
  Future<List<RewardModel>> getReward() async {
    var token = await storage.getString(Storage.tokenKey);
    var customerId = await storage.getString(Storage.userIdKey);
    final url = Uri.parse('https://api.npoint.io/d8767ae45136a56334c7');
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
        print(body);
        var result = body['result'];
        if (result['status'] == 'OK') {
          var res = RewardResponse.fromJson(body).result;
          return res.rewardList;
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
