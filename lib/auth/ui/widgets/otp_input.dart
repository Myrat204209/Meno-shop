// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({
    super.key,
    this.onSubmitPressed,
    required this.controller,
  });
  final Function(String)? onSubmitPressed;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 5,
      controller: controller,
      autofocus: true,
      hapticFeedbackType: HapticFeedbackType.vibrate,
      onSubmitted: onSubmitPressed,
    );
  }
}
