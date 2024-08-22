// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UITextField extends StatelessWidget {
  const UITextField({
    super.key,
    this.initialValue,
    this.autoFillHints,
    this.controller,
    this.inputFormatters,
    this.autocorrect = false,
    this.readOnly,
    this.hintText,
    this.validator,
    this.labelText,
    this.errorText,
    this.prefix,
    this.prefixText,
    this.suffix,
    this.keyboardType,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obscureText,
  });

  /// A value to initialize the field to.
  final String? initialValue;

  /// List of auto fill hints.
  final Iterable<String>? autoFillHints;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether to enable autocorrect.
  /// Defaults to true.
  final bool autocorrect;

  /// Whether the text field should be read-only.
  /// Defaults to false.
  final bool? readOnly;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  final String? labelText;

  /// Text that appears below the field.
  final String? errorText;

  /// A widget that appears before the editable part of the text field.
  final Widget? prefix;

  /// String that appears before the editable part of the text field
  final String? prefixText;

  /// A widget that appears after the editable part of the text field.
  final Widget? suffix;

  /// The type of keyboard to use for editing the text.
  /// Defaults to [TextInputType.text] if maxLines is one and
  /// [TextInputType.multiline] otherwise.
  final TextInputType? keyboardType;

  /// Text max length
  final int? maxLength;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  final ValueChanged<String>? onSubmitted;

  /// Called when the text field has been tapped.
  final VoidCallback? onTap;

  /// Whether the text field should obscure the text being edited.
  final bool? obscureText;

  /// The validator logic
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 45),
      child: TextFormField(
        obscuringCharacter: '*',
        key: key,
        initialValue: initialValue,
        controller: controller,
        inputFormatters: inputFormatters,
        style: AppTextStyle.text().md().regular(),
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        autocorrect: autocorrect,
        readOnly: readOnly ?? false,
        maxLength: maxLength,
        validator: validator,
        autofillHints: autoFillHints,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.neutral.shade200,
          prefixText: prefixText,
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
          prefixIcon: prefix,
          suffixIcon: suffix,
          suffixIconConstraints: BoxConstraints.tightFor(
            width: 40,
            height: 40,
          ),
          prefixIconConstraints: BoxConstraints.tightFor(
            width: 48,
          ),
        ),
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }
}
