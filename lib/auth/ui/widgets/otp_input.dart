// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({
    super.key,
    this.onSubmitPressed,
  });
  final Function(String)? onSubmitPressed;
  @override
  Widget build(BuildContext context) {
    return

        /// Otp code input
        Pinput(
      length: 5,
      autofocus: true,
      hapticFeedbackType: HapticFeedbackType.vibrate,
      onSubmitted: onSubmitPressed,
      
    );
  }
}
