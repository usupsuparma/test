import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/common/state_enum.dart';
import 'package:jangjo_customer/presentation/pages/detail_information.dart';
import 'package:jangjo_customer/presentation/pages/detail_package.dart';
import 'package:jangjo_customer/presentation/pages/login_page.dart';
import 'package:jangjo_customer/presentation/provider/auth_notifier.dart';
import 'package:jangjo_customer/presentation/provider/point_notifier.dart';
import 'package:jangjo_customer/presentation/widgets/home_login_widget.dart';
import 'package:jangjo_customer/presentation/widgets/platform_widget.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget image = Image.asset(
    'assets/ic_sequare.png',
    width: 32,
  );
  String package = 'Basic Package';
  String service = '1 recycling waste collection peer week';
  String price = '25.000';
  bool _isLogin = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => {
        Provider.of<AuthNotifier>(context, listen: false)..fetchToken(),
        Provider.of<PointNotifier>(context, listen: false)..fetchPoin(),
        // var authNotifier = Provider.of<AuthNotifier>(context, listen: false);
        // authNotifier.fetchSession();
        // try {
        //   var sess = await authNotifier.getUserSession();
        //   print(sess.token);
        //   print('================');
        //   if (sess.token != '') {
        //     setState(() {
        //       _isLogin = true;
        //     });
        //   }
        // } catch (e) {
        //   print(e);
        // }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWidget(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: edge),
                //   child: _isLogin ? HomeLogin() : HomeWelcome(),
                // ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: edge),
                    child: Consumer<AuthNotifier>(
                      builder: (context, data, child) {
                        final state = data.tokenState;
                        if (state == RequestState.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state == RequestState.loaded) {
                          var token = data.Token;
                          if (token != '') {
                            return HomeLogin();
                          } else {
                            return HomeWelcome();
                          }
                        } else {
                          return Center(child: Text('${data.message}'));
                        }
                      },
                    )),
                const SizedBox(
                  height: 16,
                ),
                JangjoServiceWidget(),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: edge),
                  child: Text(
                    'Information',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: kBlack,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: edge),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailInformation.routeName);
                      // Navigation.intentWithData(DetailInformation.routeName, 1);
                    },
                    child: Container(
                      height: 104,
                      decoration: BoxDecoration(
                        color: const Color(0xffE48063),
                        gradient: const LinearGradient(
                            colors: [Color(0xffE48063), Color(0xffFFF14B)]),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              'assets/ic_gradient_rectangle.png',
                              height: 104,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: const EdgeInsets.only(right: 4),
                              child: Image.asset(
                                'assets/ic_trash_blue.png',
                                height: 81,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 110,
                              margin: const EdgeInsets.only(bottom: 4),
                              child: Image.asset(
                                'assets/ic_trash_orange.png',
                                height: 81,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Diskon 50%!! Sampai PPKM\nturun level',
                                  style: popinsText.copyWith(
                                      color: kWhite,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Buat kamu yang ingin buang sampah dimasa\npandemi tenang aja. Ada diskon 50% menanti.',
                                      style: openSansText.copyWith(
                                          color: kWhite,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'History',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'Statistic',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'Help',
      //     ),
      //   ],
      //   selectedItemColor: kPink,
      //   showUnselectedLabels: true,
      //   unselectedFontSize: 12,
      //   unselectedItemColor: const Color(0xffc3c3c3),
      //   unselectedLabelStyle: GoogleFonts.poppins(),
      //   selectedLabelStyle: GoogleFonts.poppins(),
      // ),
    );
  }
}

// ignore: must_be_immutable
class JangjoServiceWidget extends StatelessWidget {
  Widget image = Image.asset(
    'assets/ic_sequare.png',
    width: 32,
  );
  String package = 'Basic Package';
  String service = '1 recycling waste collection peer week';
  String price = '25.000';
  JangjoServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: edge),
          child: Text(
            'Jangjo Service',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: kBlack, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: edge),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              JangjoServiceCard(
                  image: image,
                  package: package,
                  service: service,
                  price: price),
              JangjoServiceCard(
                  image: Image.asset(
                    'assets/ic_star.png',
                    width: 32,
                  ),
                  package: 'Zero Waste Package',
                  service:
                      '3 organic waste and 1 recycling waste\n collection peer week',
                  price: '75.000'),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class SubscriptionsWidget extends StatefulWidget {
  const SubscriptionsWidget({Key? key}) : super(key: key);

  @override
  State<SubscriptionsWidget> createState() => _SubscriptionsWidgetState();
}

class _SubscriptionsWidgetState extends State<SubscriptionsWidget> {
  final controller = MapController(
    location: LatLng(-6.175499, 106.827067),
  );

  final markers = [
    LatLng(35.674, 51.41),
    LatLng(35.676, 51.41),
    LatLng(35.678, 51.41),
    LatLng(35.68, 51.41),
    LatLng(35.682, 51.41),
    LatLng(35.684, 51.41),
    LatLng(35.686, 51.41),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: edge),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Subscriptions',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kBlack, fontWeight: FontWeight.w800),
              ),
              Text(
                'Manage Subscription',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kPink,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: edge),
          child: Container(
            height: 51,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xffE48063).withOpacity(0.10),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Basic Package',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: const Color(0xffE48063),
                      ),
                ),
                Text(
                  '2 / 4 Waste Picked Up',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: const Color(0xffE48063),
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 250,
          margin: const EdgeInsets.symmetric(horizontal: edge),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(2, 2),
                blurRadius: 16,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '3th Pick Up',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: kPink,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Monday, 5 December 2021',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: kGrey),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '10.00 - 11.00',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: kOrange,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  InkWell(
                    child: Container(
                      height: 24,
                      width: 77,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xff74B3ED),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'On The Way',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10, color: kWhite),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 100,
              ),
              Text(
                'Sutoyo Widyanto',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 12,
                      color: kBlack,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                'Estimate up to 10.30',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 10,
                      color: kGrayLite,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class HomeWelcome extends StatelessWidget {
  const HomeWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 141,
      width: 327,
      decoration:
          BoxDecoration(color: kPink, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Jangjo',
            style:
                Theme.of(context).textTheme.headline2!.copyWith(color: kWhite),
          ),
          Text(
            'Please Login to start using\n Jangjo services',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 10, color: kWhite, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, LoginPage.routeName);
            },
            child: Container(
              width: 84,
              height: 30,
              decoration: BoxDecoration(
                  color: kWhite, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: kPink,
                        fontWeight: FontWeight.w800,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class JangjoServiceCard extends StatelessWidget {
  const JangjoServiceCard({
    Key? key,
    required this.image,
    required this.package,
    required this.service,
    required this.price,
  }) : super(key: key);

  final Widget image;
  final String package;
  final String service;
  final String price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailPackage.routeName);
      },
      child: Container(
        height: 160,
        width: 160,
        padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(16),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(2, 2),
                blurRadius: 16,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            image,
            const SizedBox(
              width: 24,
            ),
            Text(
              package,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: kPink, fontWeight: FontWeight.w700, fontSize: 12),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              service,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: kGrey, fontSize: 10, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 4,
            ),
            Text.rich(
              TextSpan(
                  text: 'Rp$price',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kBlack, fontWeight: FontWeight.w800, fontSize: 16),
                  children: [
                    TextSpan(
                      text: '/month',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: const Color(0xffe48063),
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
