import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback? onCancel;
  final VoidCallback? onContinue;
  final bool isCancelButtonExist;
  final String confirmLabel;
  final String cancelLabel;

  CustomAlert({
    required this.title,
    required this.content,
    required this.onCancel,
    required this.onContinue,
    required this.isCancelButtonExist,
    this.confirmLabel = "Ya",
    this.cancelLabel = "Tidak",
  });

  Widget cancelButton() {
    return TextButton(
      child: Text(cancelLabel, style: const TextStyle(color: Colors.black)),
      onPressed: onCancel,
    );
  }

  Widget continueButton() {
    return TextButton(
      child: Text(confirmLabel, style: const TextStyle(color: Colors.black)),
      onPressed: onContinue,
    );
  }

  Widget alertDialog() {
    return WillPopScope(
      onWillPop: () async =>
          false, // agar dialog tidak bisa diclose ketika tombol back device ditekan
      child: AlertDialog(
        // insetPadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.only(left: 15, right: 10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: content,
        actions: [
          isCancelButtonExist ? cancelButton() : const SizedBox(),
          continueButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return alertDialog();
  }
}
