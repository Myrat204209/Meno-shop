import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_phone_text_field}
/// A name or surname text field component.
/// {@endtemplate}
class UINameTextField extends StatelessWidget {
  /// {@macro app_phone_text_field}
  const UINameTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.suffix,
    this.readOnly,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
  });

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text input label text
  final String? labelText;

  /// A widget that appears after the editable part of the text field.
  final Widget? suffix;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  /// When user done editing
  final ValueChanged<String>? onSubmitted;

  /// Whether the text field should be read-only.
  /// Defaults to false.
  final bool? readOnly;

  /// Input error message
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return UITextField(
      labelText: labelText,
      controller: controller,
      readOnly: readOnly,
      hintText: hintText,
      keyboardType: TextInputType.name,
      autoFillHints: const [AutofillHints.name],
      autocorrect: false,
      prefix: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const Icon(Icons.person_outlined),
      ),
      onChanged: onChanged,
      suffix: suffix,
      errorText: errorText,
      onSubmitted: onSubmitted,
    );
  }
}
