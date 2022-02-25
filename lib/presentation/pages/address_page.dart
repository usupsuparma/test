import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/presentation/pages/home_page.dart';
import 'package:jangjo_customer/presentation/pages/map_page.dart';
import 'package:jangjo_customer/presentation/widgets/back_button_widget.dart';
import 'package:jangjo_customer/presentation/widgets/input_text.dart';
import 'package:jangjo_customer/presentation/widgets/platform_widget.dart';
import 'package:jangjo_customer/presentation/widgets/primary_button.dart';
import 'package:jangjo_customer/presentation/widgets/secondary_button.dart';

class AddressPage extends StatelessWidget {
  static const routeName = '/address';
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWidget(
          body: BuildViewAddress(
        key: UniqueKey(),
      )),
    );
  }
}

class BuildViewAddress extends StatefulWidget {
  const BuildViewAddress({Key? key}) : super(key: key);

  @override
  _BuildViewAddressState createState() => _BuildViewAddressState();
}

class _BuildViewAddressState extends State<BuildViewAddress> {
  late TextEditingController _labelController;
  late TextEditingController _provinsiController;
  late TextEditingController _cityController;
  late TextEditingController _districtController;
  late TextEditingController _wardController;
  late TextEditingController _detailAddressController;
  late TextEditingController _postalCodeController;
  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController();
    _provinsiController = TextEditingController();
    _cityController = TextEditingController();
    _districtController = TextEditingController();
    _wardController = TextEditingController();
    _detailAddressController = TextEditingController();
    _postalCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _labelController.dispose();
    _provinsiController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _wardController.dispose();
    _detailAddressController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: edge),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              const BackButtonWidget(),
              const SizedBox(
                height: edge,
              ),
              Text(
                'Add your Address',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: kBlack),
              ),
              Text(
                'The address will be used for the waste pick-up address',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 17, color: kGrey),
              ),
              const SizedBox(
                height: edge,
              ),
              InputText(controller: _labelController, hintText: 'Label'),
              const SizedBox(
                height: 24,
              ),
              InputText(
                  controller: _provinsiController, hintText: 'City, Province'),
              const SizedBox(
                height: 24,
              ),
              InputText(
                  controller: _districtController, hintText: 'Distirct, Ward'),
              const SizedBox(
                height: 24,
              ),
              InputText(
                  controller: _detailAddressController,
                  hintText: 'Detail Address'),
              const SizedBox(
                height: 24,
              ),
              InputText(
                  controller: _postalCodeController, hintText: 'Postal Code'),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MapPage.routeName);
                },
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kBackground, width: 2)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.place,
                        color: kPink,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Pin Address',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: kGrey),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: edge,
              ),
              PrimaryButton(
                text: 'Save',
                onTap: () {
                  Navigator.pushNamed(context, HomePage.routeName);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              SecondaryButton(
                text: 'Skip',
                onTap: () {
                  Navigator.pushNamed(context, HomePage.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
