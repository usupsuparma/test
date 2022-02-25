import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required TextEditingController controller,
    required String hintText,
    Icon? icon,
    this.secureText = false,
  })  : _controller = controller,
        _hintText = hintText,
        _icon = icon,
        super(key: key);

  final TextEditingController _controller;
  final String _hintText;
  final Icon? _icon;
  final bool secureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: _controller,
        style: const TextStyle(
            color: kBlack, fontSize: 16, fontWeight: FontWeight.w600),
        obscureText: secureText,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: _hintText,
          prefixIcon: _icon,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide(color: kBackground, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: kBackground, width: 2),
          ),
        ),
      ),
    );
  }
}
