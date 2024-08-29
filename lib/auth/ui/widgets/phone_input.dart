import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';

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
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Hokmany doldurmaly';
        }

        if (value!.length != 8) {
          return '8 belgili nomer bolmaly';
        }

        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: context.l10n.phoneInput,
        hintText: "61234567",
        prefixText: "+993 ",
        prefixStyle: const AppTextStyle.text().semiBold().md(),
        // errorText: error,
      ),
    );
  }
}
