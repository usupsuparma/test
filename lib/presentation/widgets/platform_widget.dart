import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jangjo_customer/presentation/widgets/web_widget.dart';

class PlatformWidget extends StatelessWidget {
  final Widget body;
  const PlatformWidget({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return body;
      case TargetPlatform.iOS:
        return body;
      default:
        return WebWidget(body: body);
    }
  }
}
