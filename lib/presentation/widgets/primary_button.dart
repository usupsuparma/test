import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool enable;
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ElevatedButton(
          onPressed: enable ? onTap : null,
          child: SizedBox(
            height: 56,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(color: kWhite, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
