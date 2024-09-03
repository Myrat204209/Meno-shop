// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final defaultStyle =
    const AppTextStyle.text().xs().regular().copyWith(color: Colors.black);
final linkStyle =
    const AppTextStyle.text().xs().regular().withColor(Colors.blue);

class AuthPrivacyPolicyView extends StatelessWidget {
  const AuthPrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      softWrap: true,
      maxLines: 2,
      text: TextSpan(
        text: 'Dowam etmek bilen Men',
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(
              text: ' gizlinlik syýasatyny ',
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () => showPrivacyPolicyBottomSheet(context: context)),
          TextSpan(
            text: 'we\n',
            style: defaultStyle,
          ),
          TextSpan(
              text: 'ulanmak düzgünlerini',
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () => showPrivacyPolicyBottomSheet(context: context)),
          TextSpan(
            text: ' kabul edýärin',
            style: defaultStyle,
          ),
        ],
      ),
    );
  }
}

Future<void> showPrivacyPolicyBottomSheet({
  required BuildContext context,
}) async =>
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) => const PrivacyPolicyBottomSheet(),
    );

class PrivacyPolicyBottomSheet extends StatelessWidget {
  const PrivacyPolicyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      bottomModalChildren: [],
    );
  }
}
