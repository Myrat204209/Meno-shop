// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({super.key});
  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UITextField(
      controller: _controller,
      prefix: Icon(
        Icons.search,
        color: UIColors.neutral.shade700,
      ),
      hintText: 'Search from shop...',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
