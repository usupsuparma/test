import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/presentation/widgets/platform_widget.dart';
import 'package:jangjo_customer/presentation/widgets/primary_button.dart';

class DetailPackage extends StatelessWidget {
  static const routeName = '/detail-package';
  const DetailPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Package'),
      ),
      body: PlatformWidget(
        body: BuildViewDetailPackagePage(
          key: UniqueKey(),
        ),
      ),
    );
  }
}

class BuildViewDetailPackagePage extends StatefulWidget {
  const BuildViewDetailPackagePage({Key? key}) : super(key: key);

  @override
  _BuildViewDetailPackagePageState createState() =>
      _BuildViewDetailPackagePageState();
}

class _BuildViewDetailPackagePageState
    extends State<BuildViewDetailPackagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: edge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/ic_success.png',
              height: 232,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '1 recycling waste collection peer week',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: kPink, fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Description',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: const Color(0xff1B1D28), fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra mauris tincidunt mi, tellus, lacinia cras. Quis tempor sed morbi eu lectus mattis nec dictum sagittis. ',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: const Color(0xff22292E),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Pick Option',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: kBlack),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ItemPackage(),
                ItemPackage(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            PrimaryButton(text: 'Subsribe', onTap: () {}),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    ));
  }
}

class ItemPackage extends StatelessWidget {
  const ItemPackage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        boxShadow: [
          BoxShadow(
            color: kBlack.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 16,
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: kPink,
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Starter Plan',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kPink,
                      fontSize: 14,
                    ),
              )
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            '1 month subs',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: const Color(0xffA2A0A8),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Rp25.000',
            style:
                Theme.of(context).textTheme.subtitle1!.copyWith(color: kBlack),
          ),
        ],
      ),
    );
  }
}
