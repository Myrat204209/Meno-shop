import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/features/auth/ui/login_page/widgets/bottomsheet.dart';

class PrivatePolicyForm extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool?> onCheckboxChanged;
  final AnimationController animationController;

  const PrivatePolicyForm({
    super.key,
    required this.isChecked,
    required this.onCheckboxChanged,
    required this.animationController,
  });

  @override
  _PrivatePolicyFormState createState() => _PrivatePolicyFormState();
}

class _PrivatePolicyFormState extends State<PrivatePolicyForm>
    with SingleTickerProviderStateMixin {
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedBuilder(
          animation: _shakeAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_shakeAnimation.value, 0),
              child: Checkbox(
                value: widget.isChecked,
                onChanged: widget.onCheckboxChanged,
                activeColor: AppColors.secondary,
              ),
            );
          },
        ),
        SizedBox(
          width: 310,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.0)),
                ),
                backgroundColor: Colors.white,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const BottomShet();
                },
              );
            },
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: 'Dowam etmek bilen Men',
                style: const AppTextStyle.text()
                    .xs()
                    .regular()
                    .copyWith(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: ' gizlinlik syýasatyny we',
                    style: const AppTextStyle.text()
                        .xs()
                        .regular()
                        .withColor(Colors.blue),
                  ),
                  TextSpan(
                    text: ' ulanmak düzgünlerini',
                    style: const AppTextStyle.text()
                        .xs()
                        .regular()
                        .withColor(Colors.blue),
                  ),
                  TextSpan(
                    text: ' kabul edýärin',
                    style: const AppTextStyle.text()
                        .xs()
                        .regular()
                        .withColor(Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
