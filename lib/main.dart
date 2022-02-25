import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/common/utils.dart';
import 'package:jangjo_customer/presentation/pages/address_page.dart';
import 'package:jangjo_customer/presentation/pages/detail_information.dart';
import 'package:jangjo_customer/presentation/pages/detail_package.dart';
import 'package:jangjo_customer/presentation/pages/home_page.dart';
import 'package:jangjo_customer/presentation/pages/login_page.dart';
import 'package:jangjo_customer/presentation/pages/map_page.dart';
import 'package:jangjo_customer/presentation/pages/onboarding_page.dart';
import 'package:jangjo_customer/presentation/pages/otp_page.dart';
import 'package:jangjo_customer/presentation/pages/register_page.dart';
import 'package:jangjo_customer/presentation/pages/reward_page.dart';
import 'package:jangjo_customer/presentation/pages/splash_page.dart';
import 'package:jangjo_customer/injection.dart' as di;
import 'package:jangjo_customer/presentation/provider/auth_notifier.dart';
import 'package:jangjo_customer/presentation/provider/point_notifier.dart';
import 'package:jangjo_customer/presentation/provider/reward_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<AuthNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PointNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<RewardNotifier>(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData().copyWith(
            primaryColor: kWhite,
            scaffoldBackgroundColor: kWhite,
            textTheme: kTextTheme,
            backgroundColor: const Color(0xffffffff),
            colorScheme: kColorScheme.copyWith(secondary: kPink)),
        home: const SplashPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case SplashPage.routeName:
              return MaterialPageRoute(builder: (_) => SplashPage());
            case OnboardingPage.routeName:
              return MaterialPageRoute(builder: (_) => OnboardingPage());
            case LoginPage.routeName:
              return MaterialPageRoute(builder: (_) => LoginPage());
            case OtpPage.routeName:
              return MaterialPageRoute(builder: (_) => OtpPage());
            case RegisterPage.routeName:
              return MaterialPageRoute(builder: (_) => RegisterPage());
            case AddressPage.routeName:
              return MaterialPageRoute(builder: (_) => AddressPage());
            case MapPage.routeName:
              return MaterialPageRoute(builder: (_) => MapPage());
            case HomePage.routeName:
              return MaterialPageRoute(builder: (_) => HomePage());
            case DetailPackage.routeName:
              return MaterialPageRoute(builder: (_) => DetailPackage());
            case RewardPage.routeName:
              final status = settings.arguments as Enum;
              return MaterialPageRoute(
                builder: (_) => RewardPage(status: status),
                settings: settings,
              );
            case DetailInformation.routeName:
              return MaterialPageRoute(
                builder: (_) => const DetailInformation(),
              );
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
