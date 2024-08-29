import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';

class AuthPrivacyPolicyText extends StatelessWidget {
  const AuthPrivacyPolicyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(context.l10n.acceptPolice),
    );
  }
}
