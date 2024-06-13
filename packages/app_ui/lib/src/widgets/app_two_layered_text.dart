import 'package:flutter/material.dart';

class AppTwoLayeredTextWidget extends StatelessWidget {
  const AppTwoLayeredTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1400 TMT',
        ),
        Text(
          '550 TMT',
        ),
        // const Text()
      ],
    );
  }
}
