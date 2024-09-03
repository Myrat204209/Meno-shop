import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppRadioButton extends HookWidget {
  const AppRadioButton({
    super.key,
    required this.text,
    required this.values,
  });

  final String text;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    // Use useState to manage the selected radio button value
    final tapValue = useState(0);

    return Column(
      children: [
        AppWrapper(
          borderColor: AppColors.neutral.shade100,
          child: Text(
            text,
          ).centralize(),
        ),
        SizedBox(
          height: values.length * 100,
          child: ListView.builder(
            itemCount: values.length,
            itemBuilder: (context, index) {
              return Material(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.neutral.shade100,
                child: InkWell(
                  radius: 100,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    // Update the tapValue using useState
                    tapValue.value = index;
                  },
                  child: ListTile(
                    leading: Radio.adaptive(
                      value: index,
                      groupValue: tapValue.value,
                      onChanged: (value) {
                        // Update the tapValue when the radio button is selected
                        tapValue.value = value as int;
                      },
                    ),
                    title: Text(
                      values[index],
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
