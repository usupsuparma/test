import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WebWidget extends StatelessWidget {
  final Widget body;
  double width;
  WebWidget({Key? key, required this.body, this.width = 410}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: width,
          child: body,
        ),
      ),
    );
  }
}
