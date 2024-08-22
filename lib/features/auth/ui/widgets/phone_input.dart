import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({
    super.key,
    this.onChanged,
    this.readOnly = false,
    this.initialValue,
    this.error,
  });

  final void Function(String phone)? onChanged;
  final bool readOnly;
  final String? initialValue;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      maxLength: 8,
      validator: (_) => error,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Telefon belgiňizi giriziň",
        hintText: "61234567",
        prefixText: "+993 ",
        prefixStyle: const AppTextStyle.text().semiBold().md(),
        // errorText: error,
      ),
    );
  }
}
