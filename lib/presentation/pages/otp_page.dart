import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/presentation/pages/address_page.dart';
import 'package:jangjo_customer/presentation/widgets/back_button_widget.dart';
import 'package:jangjo_customer/presentation/widgets/platform_widget.dart';
import 'package:jangjo_customer/presentation/widgets/primary_button.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpPage extends StatelessWidget {
  // ignore: constant_identifier_names
  static const routeName = '/otp';
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWidget(
        body: BuildViewOtp(
          key: UniqueKey(),
        ),
      ),
    );
  }
}

class BuildViewOtp extends StatefulWidget {
  const BuildViewOtp({Key? key}) : super(key: key);

  @override
  _BuildViewOtpState createState() => _BuildViewOtpState();
}

class _BuildViewOtpState extends State<BuildViewOtp> {
  final TextEditingController _pinPutController = TextEditingController();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: const Color(0xffF9F9FA),
      border: Border.all(color: const Color(0xffF9F9FA)),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: BackButtonWidget(),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'OTP Authentication',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: kBlack),
                    ),
                    Text(
                      'An authentication code has been sent to',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: kGrey),
                    ),
                    Text(
                      'danieltravis@gmail.com',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: kBlack),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: edge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: SizedBox(
                height: 66,
                child: PinPut(
                  fieldsCount: 4,
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: kBlack),
                  onSubmit: (String pin) {},
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xffF9F9FA).withOpacity(0.5),
                    ),
                  ),
                  eachFieldWidth: 66,
                ),
              ),
            ),
            const SizedBox(
              height: edge,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: edge),
                child: PrimaryButton(
                  text: 'Continue',
                  onTap: () {
                    Navigator.pushNamed(context, AddressPage.routeName);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
