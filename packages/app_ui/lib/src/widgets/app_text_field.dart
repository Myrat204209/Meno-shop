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

  /// A text field component based on material [TextFormField] widget which
  /// extends TextField with email icon and validates input type.
  const UITextField.emailTextField({
    super.key,
    this.initialValue,
    this.controller,
    this.inputFormatters,
    thiseadOnly = false,
    this.hintText,
    this.errorText,
    this.prefixText,
    this.suffix,
    this.maxLength,
    this.labelText,
    this.prefix,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obscureText,
    this.readOnly,
  })  : keyboardType = TextInputType.emailAddress,
        autoFillHints = const [AutofillHints.email],
        autocorrect = false;

  /// A password text field component based on material [TextFormField] widget which
  /// extends TextField which obscures the text

  const UITextField.passwordTextField({
    super.key,
    this.initialValue,
    this.controller,
    this.inputFormatters,
    thiseadOnly = false,
    this.errorText,
    this.prefixText,
    this.maxLength,
    this.labelText,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.suffix,
    this.keyboardType,
    this.autoFillHints,
    this.prefix,
    this.readOnly,
  })  : hintText = 'Password',
        obscureText = true,
        autocorrect = false;

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

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 45),
      child: TextFormField(
        obscuringCharacter: '*',
        cursorHeight: 18,
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
