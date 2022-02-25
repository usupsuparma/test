import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jangjo_customer/presentation/pages/home_page.dart';
import 'package:jangjo_customer/presentation/pages/onboarding_page.dart';
import 'package:jangjo_customer/presentation/provider/auth_notifier.dart';
import 'package:jangjo_customer/presentation/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

// class SplashPage extends StatelessWidget {
//   static const routeName = '/splash';
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PlatformWidget(
//         body: SplashPage(
//           key: UniqueKey(),
//         ),
//       ),
//     );
//   }
// }

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      var authNotifier = Provider.of<AuthNotifier>(context, listen: false);
      try {
        var sess = await authNotifier.getUserSession();
        print(sess.token);
        print('================');
        if (sess.token != '') {
          Navigator.pushReplacementNamed(context, HomePage.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnboardingPage.routeName);
        }
      } catch (e) {
        Navigator.pushReplacementNamed(context, OnboardingPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWidget(
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Image.asset(
                'assets/ic_logo.png',
                width: 133,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
