import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back,
        size: 24,
        color: kBlack,
      ),
    );
  }
}
