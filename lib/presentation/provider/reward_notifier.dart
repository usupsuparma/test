import 'package:flutter/cupertino.dart';
import 'package:jangjo_customer/common/state_enum.dart';
import 'package:jangjo_customer/domain/entities/reward.dart';
import 'package:jangjo_customer/domain/usecases/get_rewards.dart';

class RewardNotifier extends ChangeNotifier {
  final GetRewards getRewards;
  RewardNotifier({required this.getRewards});

  String _message = '';
  String get message => _message;

  RequestState _requestStateReward = RequestState.empty;
  RequestState get stateReward => _requestStateReward;

  List<Reward> _rewards = [];
  List<Reward> get rewards => _rewards;

  Future<void> fetchReward() async {
    _requestStateReward = RequestState.loading;
    notifyListeners();
    final result = await getRewards.execute();
    result.fold(
      (failure) {
        _requestStateReward = RequestState.error;
        print(failure.message);
        _message = failure.message;
        notifyListeners();
      },
      (rewards) {
        _requestStateReward = RequestState.loaded;
        _rewards = rewards;
        notifyListeners();
      },
    );
  }
}
