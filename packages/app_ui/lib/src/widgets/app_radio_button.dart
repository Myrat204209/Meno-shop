// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppRadioButton extends StatefulWidget {
  const AppRadioButton({
    super.key,
    required this.text,
    required this.values,
  });
  final String text;
  final List<String> values;

  @override
  State<AppRadioButton> createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<AppRadioButton> {
  int _tapValue = 0;
  void stateChange(value) {
    setState(() {
      _tapValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppWrapper(
          borderColor: AppColors.neutral.shade100,
          child: Text(
            widget.text,
          ).centralize(),
        ),
        SizedBox(
          height: widget.values.length * 100,
          child: ListView.builder(
            itemCount: widget.values.length,
            itemBuilder: (context, index) {
              return Material(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.neutral.shade100,
                child: InkWell(
                  radius: 100,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    //TODO: onTap function must have Logic,
                    stateChange(index);
                  },
                  child: ListTile(
                    leading: Radio.adaptive(
                      value: index,
                      groupValue: _tapValue,
                      onChanged: stateChange,
                    ),
                    title: Text(
                      widget.values[index],
                    ),
                  ),
                ),
              ).paddingSymmetric(horizontal: 26, vertical: 5);
            },
          ),
        ),
      ],
    );
  }
}
