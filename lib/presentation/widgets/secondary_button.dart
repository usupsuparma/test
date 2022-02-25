import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: const Color(0xffFFF5F9),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Expanded(
                child: Center(
              child: Text(
                text,
                style: const TextStyle(color: kPink),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
