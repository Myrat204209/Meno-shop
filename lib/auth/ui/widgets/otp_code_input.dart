import 'package:flutter/material.dart';

class OtpCodeInput extends StatelessWidget {
  const OtpCodeInput({
    super.key,
    this.onChanged,
    this.readOnly = false,
  });

  final void Function(String phone)? onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Kod",
        suffixIcon: Icon(Icons.code),
      ),
    );
  }
}
