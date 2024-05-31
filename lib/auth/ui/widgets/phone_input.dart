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
      validator: (_) => error,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Telefon belgiňiz",
        hintText: "61234567",
        prefixText: "+993 ",
        suffixIcon: Icon(Icons.phone),
        // errorText: error,
      ),
    );
  }
}
