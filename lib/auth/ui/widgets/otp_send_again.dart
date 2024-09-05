// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/l10n/l10n.dart';

final sendAgainDefaultStyle = const AppTextStyle.text().withColor(Colors.black);
final sendAgainLinkStyle =
    const AppTextStyle.text().withColor(AppColors.secondary);

class OtpSendAgain extends StatelessWidget {
  const OtpSendAgain({
    super.key,
    required this.onSendAgainPressed,
  });

  final VoidCallback onSendAgainPressed;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      softWrap: true,
      maxLines: 2,
      text: TextSpan(
        text: 'Code gelmedi.  ',
        style: sendAgainDefaultStyle,
        children: <TextSpan>[
          TextSpan(
              text: context.l10n.sendAgain,
              style: sendAgainLinkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () => onSendAgainPressed),
        ],
      ),
    );
  }
}
