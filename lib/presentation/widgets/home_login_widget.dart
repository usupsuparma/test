import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/common/state_enum.dart';
import 'package:jangjo_customer/presentation/pages/reward_page.dart';
import 'package:jangjo_customer/presentation/provider/auth_notifier.dart';
import 'package:jangjo_customer/presentation/provider/point_notifier.dart';
import 'package:provider/provider.dart';

class HomeLogin extends StatelessWidget {
  const HomeLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hello,',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: kGrey, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const Icon(
              Icons.notifications,
              color: kPink,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Consumer<AuthNotifier>(
          builder: (context, data, child) {
            return Text(
              data.session.fullname,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w700, color: kBlack),
            );
          },
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          height: 100,
          padding:
              const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: kPink),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RewardPage.routeName,
                      arguments: RewardStatus.history);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Poin  Jangjo',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: kWhite),
                    ),
                    Consumer<PointNotifier>(
                      builder: (context, data, child) {
                        final state = data.pointState;
                        if (state == RequestState.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state == RequestState.loaded) {
                          return Text(
                            '${data.point}',
                            style: GoogleFonts.lato().copyWith(
                              color: kWhite,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          );
                        } else {
                          return Text(
                            '0',
                            style: GoogleFonts.lato().copyWith(
                              color: kWhite,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: edge,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RewardPage.routeName,
                      arguments: RewardStatus.history);
                  // Navigation.intentWithData(
                  //     RewardPage.routeName, RewardStatus.history);
                },
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(45)),
                      child: const Icon(
                        Icons.access_time,
                        size: 14,
                        color: kWhite,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Riwayat',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: kWhite,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: edge,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RewardPage.routeName,
                      arguments: RewardStatus.reward);
                },
                child: Column(
                  children: [
                    Container(
                        width: 32,
                        height: 32,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(45)),
                        child: Image.asset(
                          'assets/ic_transaction.png',
                          width: 14,
                          height: 14,
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Tukar Poin',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: kWhite,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
