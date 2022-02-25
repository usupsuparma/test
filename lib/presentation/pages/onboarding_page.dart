import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/presentation/pages/home_page.dart';
import 'package:jangjo_customer/presentation/pages/login_page.dart';
import 'package:jangjo_customer/presentation/pages/register_page.dart';
import 'package:jangjo_customer/presentation/widgets/platform_widget.dart';
import 'package:jangjo_customer/presentation/widgets/primary_button.dart';
import 'package:jangjo_customer/presentation/widgets/secondary_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  static const routeName = '/onboarding';
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWidget(
        body: BuildViewOnboarding(
          key: UniqueKey(),
        ),
      ),
    );
  }
}

class BuildViewOnboarding extends StatefulWidget {
  const BuildViewOnboarding({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildViewOnboarding> createState() => _BuildViewOnboardingState();
}

class _BuildViewOnboardingState extends State<BuildViewOnboarding> {
  int activeIndex = 0;

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: onBoardingList.length,
        effect: const ExpandingDotsEffect(
            activeDotColor: kPink, dotColor: kGrayLite),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: edge, right: edge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome to Jangjo',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: kGrey),
                  ),
                  InkWell(
                    child: Container(
                      height: 34,
                      width: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffF9F9FA),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, HomePage.routeName);
                          },
                          child: Text(
                            'Skip',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: kBlack),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CarouselSlider(
              items: onBoardingList.map(
                (item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: kBlack),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Center(
                              child: Image.asset(
                                item.image,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ).toList(),
              options: CarouselOptions(
                height: 420,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.linear,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            Center(
              child: buildIndicator(),
            ),
            const SizedBox(
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: PrimaryButton(
                text: 'Login',
                onTap: () {
                  Navigator.pushNamed(context, LoginPage.routeName);
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: SecondaryButton(
                text: 'Create an account',
                onTap: () {
                  Navigator.pushNamed(context, RegisterPage.routeName);
                },
              ),
            ),
            const SizedBox(
              height: 56,
            )
          ],
        ),
      ),
    );
  }
}
