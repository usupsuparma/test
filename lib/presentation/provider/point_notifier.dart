import 'package:flutter/cupertino.dart';
import 'package:jangjo_customer/common/state_enum.dart';
import 'package:jangjo_customer/domain/entities/point.dart';
import 'package:jangjo_customer/domain/usecases/get_point.dart';
import 'package:jangjo_customer/domain/usecases/get_point_history.dart';

class PointNotifier extends ChangeNotifier {
  final GetPoint getPoint;
  final GetPointHistory getPointHistory;

  PointNotifier({required this.getPoint, required this.getPointHistory});

  RequestState _pointState = RequestState.empty;
  RequestState get pointState => _pointState;

  int _point = 0;
  int get point => _point;

  String _message = '';
  String get message => _message;

  List<Point> _points = [];
  List<Point> get points => _points;
  RequestState _pointHistoryState = RequestState.empty;
  RequestState get pointHistoryState => _pointHistoryState;

  Future<void> fetchPoin() async {
    _pointState = RequestState.loading;
    notifyListeners();

    final result = await getPoint.execute();
    result.fold(
      (failure) {
        _pointState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (point) {
        _pointState = RequestState.loaded;
        _point = point;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPointHistory() async {
    _pointHistoryState = RequestState.loading;
    notifyListeners();
    final result = await getPointHistory.execute();
    result.fold(
      (failure) {
        _pointHistoryState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (points) {
        _pointHistoryState = RequestState.loaded;
        _points = points;
        notifyListeners();
      },
    );
  }
}
