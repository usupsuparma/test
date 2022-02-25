import 'package:flutter/foundation.dart';
import 'package:jangjo_customer/common/state_enum.dart';
import 'package:jangjo_customer/domain/entities/session.dart';
import 'package:jangjo_customer/domain/usecases/auth_login.dart';
import 'package:jangjo_customer/domain/usecases/create_session.dart';
import 'package:jangjo_customer/domain/usecases/fetch_session.dart';
import 'package:jangjo_customer/domain/usecases/get_session.dart';
import 'package:jangjo_customer/domain/usecases/get_token.dart';

class AuthNotifier extends ChangeNotifier {
  final AuthLogin authLogin;
  final CreateSession createSession;
  final GetSession getSession;
  final FetchSession fetchSessionUsecase;
  final GetToken getToken;

  AuthNotifier({
    required this.authLogin,
    required this.createSession,
    required this.getSession,
    required this.fetchSessionUsecase,
    required this.getToken,
  });

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  late Session _session;
  Session get session => _session;

  String _message = '';
  String get message => _message;

  RequestState _getSessionState = RequestState.empty;
  RequestState get getSessionState => _getSessionState;

  RequestState _tokenState = RequestState.empty;
  RequestState get tokenState => _tokenState;

  String _token = '';
  String get Token => _token;

  Future<void> loginUser(String username, String password) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await authLogin.execute(username, password);

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (data) {
        // _user = data;
        _state = RequestState.loaded;
        createSession.execute(data);
        notifyListeners();
      },
    );
  }

  Future<Session> getUserSession() async {
    _getSessionState = RequestState.loading;
    // notifyListeners();
    final result = await getSession.execute();
    _session = result;
    return result;
    // result.fold((failure) {
    //   _message = failure.message;
    //   _state = RequestState.error;
    //   notifyListeners();
    // }, (data) {
    //   _session = data;
    //   _state = RequestState.loaded;
    //   notifyListeners();
    // });
  }

  Future<void> fetchSession() async {
    _getSessionState = RequestState.loading;
    notifyListeners();
    print('fetch session');

    final result = await fetchSessionUsecase.execute();
    result.fold(
      (failure) {
        _message = failure.message;
        _getSessionState = RequestState.error;
        notifyListeners();
      },
      (data) {
        // _user = data;
        _getSessionState = RequestState.loaded;
        _session = data;
        print(data);
        notifyListeners();
      },
    );
  }

  Future<void> fetchToken() async {
    _tokenState = RequestState.loading;
    notifyListeners();
    print('fetch token');

    final result = await getToken.execute();
    result.fold(
      (failure) {
        _message = failure.message;
        _tokenState = RequestState.error;
        notifyListeners();
      },
      (token) {
        _tokenState = RequestState.loaded;
        _token = token;
        print(token);
        notifyListeners();
      },
    );
  }
}
