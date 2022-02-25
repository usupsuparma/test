import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:jangjo_customer/data/datasources/auth_local_data_source.dart';
import 'package:jangjo_customer/data/datasources/auth_remote_data_source.dart';
import 'package:jangjo_customer/data/datasources/db/storage.dart';
import 'package:jangjo_customer/data/datasources/point_remote_data_source.dart';
import 'package:jangjo_customer/data/datasources/reward_remote_data.source.dart';
import 'package:jangjo_customer/data/repositories/auth_repository_impl.dart';
import 'package:jangjo_customer/data/repositories/point_repository_impl.dart';
import 'package:jangjo_customer/data/repositories/reward_repository_impl.dart';
import 'package:jangjo_customer/domain/repositories/auth_repositories.dart';
import 'package:jangjo_customer/domain/repositories/point_repository.dart';
import 'package:jangjo_customer/domain/repositories/reward_repository.dart';
import 'package:jangjo_customer/domain/usecases/auth_login.dart';
import 'package:jangjo_customer/domain/usecases/create_session.dart';
import 'package:jangjo_customer/domain/usecases/fetch_session.dart';
import 'package:jangjo_customer/domain/usecases/get_point.dart';
import 'package:jangjo_customer/domain/usecases/get_point_history.dart';
import 'package:jangjo_customer/domain/usecases/get_rewards.dart';
import 'package:jangjo_customer/domain/usecases/get_session.dart';
import 'package:jangjo_customer/domain/usecases/get_token.dart';
import 'package:jangjo_customer/presentation/provider/auth_notifier.dart';
import 'package:jangjo_customer/presentation/provider/point_notifier.dart';
import 'package:jangjo_customer/presentation/provider/reward_notifier.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => AuthNotifier(
      authLogin: locator(),
      createSession: locator(),
      getSession: locator(),
      fetchSessionUsecase: locator(),
      getToken: locator(),
    ),
  );
  locator.registerFactory(
    () => PointNotifier(
      getPoint: locator(),
      getPointHistory: locator(),
    ),
  );
  locator.registerFactory(
    () => RewardNotifier(
      getRewards: locator(),
    ),
  );

  // usecase
  locator.registerLazySingleton(() => AuthLogin(locator()));
  locator.registerLazySingleton(() => CreateSession(locator()));
  locator.registerLazySingleton(() => GetSession(locator()));
  locator.registerLazySingleton(() => GetPoint(pointRepository: locator()));
  locator.registerLazySingleton(() => FetchSession(repository: locator()));
  locator.registerLazySingleton(
    () => GetPointHistory(
      pointRepository: locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetRewards(
      rewardRepository: locator(),
    ),
  );
  locator.registerLazySingleton(() => GetToken(authRepository: locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<PointRepository>(
    () => PointRepositoryImpl(
      pointRemoteDatasource: locator(),
    ),
  );
  locator.registerLazySingleton<RewardRepository>(
    () => RewardRepositoryImpl(remoteDatasource: locator()),
  );

  // data source
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(storage: locator()));
  locator.registerLazySingleton<PointRemoteDatasource>(
    () => PointRemoteDatasourceImpl(
      client: locator(),
      storage: locator(),
    ),
  );
  locator.registerLazySingleton<RewardRemoteDatasource>(
      () => RewardRemoteDatasourceImpl(client: locator(), storage: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(
      () => Storage(flutterSecureStorage: const FlutterSecureStorage()));
}
