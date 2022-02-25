import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/common/state_enum.dart';
import 'package:jangjo_customer/domain/entities/point.dart';
import 'package:jangjo_customer/domain/entities/reward.dart';
import 'package:jangjo_customer/presentation/provider/point_notifier.dart';
import 'package:jangjo_customer/presentation/provider/reward_notifier.dart';
import 'package:jangjo_customer/presentation/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class RewardPage extends StatefulWidget {
  static const routeName = '/Reward-page';
  final Enum status;
  RewardPage({required this.status});

  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  String title = 'history';
  bool _isButtonHistory = true;
  bool _isButtonReward = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => {
        Provider.of<PointNotifier>(context, listen: false)..fetchPointHistory(),
        Provider.of<RewardNotifier>(context, listen: false)..fetchReward(),
      },
    );
    if (widget.status == RewardStatus.reward) {
      setState(() {
        _isButtonHistory = false;
        _isButtonReward = true;
      });
    }
  }

  final List<int> numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: PlatformWidget(
        body: Column(
          children: [
            Header(),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: Row(
                children: [
                  _isButtonHistory
                      ? ActiveButton(
                          title: 'History',
                          onTap: () {
                            setState(() {
                              _isButtonHistory = !_isButtonHistory;
                              _isButtonReward = !_isButtonReward;
                            });
                          },
                        )
                      : DeactiveButton(
                          title: 'History',
                          onTap: () {
                            setState(() {
                              _isButtonHistory = !_isButtonHistory;
                              _isButtonReward = !_isButtonReward;
                            });
                          },
                        ),
                  const SizedBox(
                    width: edge,
                  ),
                  _isButtonReward
                      ? ActiveButton(
                          title: 'Rewards',
                          onTap: () {
                            setState(() {
                              _isButtonHistory = !_isButtonHistory;
                              _isButtonReward = !_isButtonReward;
                            });
                          },
                        )
                      : DeactiveButton(
                          title: 'Rewards',
                          onTap: () {
                            setState(() {
                              _isButtonHistory = !_isButtonHistory;
                              _isButtonReward = !_isButtonReward;
                            });
                          },
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (_isButtonHistory)
              Consumer<PointNotifier>(builder: (context, data, child) {
                final state = data.pointHistoryState;
                if (state == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.loaded) {
                  return HistoryList(points: data.points);
                } else {
                  return const Center(child: Text('Failed load data'));
                }
              })
            else
              Consumer<RewardNotifier>(builder: (context, data, child) {
                final state = data.stateReward;
                if (state == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.loaded) {
                  return RewardList(rewards: data.rewards);
                } else {
                  return Center(child: Text('${data.message}'));
                }
              })
          ],
        ),
      ),
    );
  }
}

class RewardList extends StatelessWidget {
  RewardList({required this.rewards});

  final List<Reward> rewards;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: edge),
      child: ListView(
        shrinkWrap: true,
        children: rewards.map((item) {
          return RedeemItem(item);
        }).toList(),
      ),
    );
  }
}

class HistoryList extends StatelessWidget {
  const HistoryList({
    Key? key,
    required this.points,
  }) : super(key: key);

  final List<Point> points;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: edge),
      child: ListView(
        shrinkWrap: true,
        children: points.map((item) {
          if (item.type == 'INCOMING') {
            return IncomingReward(point: item);
          } else {
            return PointExchange(point: item);
          }
        }).toList(),
      ),
    );
  }
}

class RedeemItem extends StatelessWidget {
  final Reward reward;

  RedeemItem(this.reward);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 109,
      child: Row(
        children: [
          Image.network(
            reward.imageLink,
            width: 50,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reward.rewardName,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: const Color(0xff4F5C88),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              Text(
                '${reward.amount} Poin',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kPink,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 30,
                  width: 87,
                  decoration: BoxDecoration(
                      color: kPink, borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      'Redeem',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DeactiveButton extends StatelessWidget {
  const DeactiveButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 106,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: kWhite,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: kBlack,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}

class ActiveButton extends StatelessWidget {
  const ActiveButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 106,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: kPink,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: kPink,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}

class IncomingReward extends StatelessWidget {
  const IncomingReward({
    required this.point,
    Key? key,
  }) : super(key: key);

  final Point point;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xff36DD47).withOpacity(0.10),
              borderRadius: BorderRadius.circular(45),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_downward,
                color: Color(0xff36DD47),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Incoming Reward',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kBlack, fontSize: 14, fontWeight: FontWeight.w700),
              ),
              Text(
                DateFormat("d MMMM yyyy", "id_ID")
                    .format(DateTime.parse(point.date)),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kGrey, fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '+${point.point} point',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: kGreeen,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class PointExchange extends StatelessWidget {
  PointExchange({required this.point});

  final Point point;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xffe13226).withOpacity(0.10),
              borderRadius: BorderRadius.circular(45),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_upward,
                color: Color(0xffe13226),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Incoming Reward',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kBlack, fontSize: 14, fontWeight: FontWeight.w700),
              ),
              Text(
                DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.now()),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kGrey, fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '+${point.point} point',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: const Color(0xffe13226),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 208,
      padding: const EdgeInsets.only(left: edge, right: edge, top: edge),
      decoration: const BoxDecoration(
        color: kPink,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/ic_back.png',
                  width: 14,
                  height: 14,
                  color: kWhite,
                ),
              ),
              const Spacer(),
              Text(
                'Jangjo Point',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: kWhite, fontWeight: FontWeight.w800),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: Consumer<PointNotifier>(
              builder: (context, data, child) {
                final state = data.pointState;
                if (state == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.loaded) {
                  return Text(
                    '3,500',
                    style: GoogleFonts.lato().copyWith(
                      color: kWhite,
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                    ),
                  );
                } else {
                  return Center(child: Text('${data.message}'));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
