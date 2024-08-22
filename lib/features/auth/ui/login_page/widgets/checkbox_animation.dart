import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppp());
}

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckboxShakeDemo(),
    );
  }
}

class CheckboxShakeDemo extends StatefulWidget {
  const CheckboxShakeDemo({super.key});

  @override
  _CheckboxShakeDemoState createState() => _CheckboxShakeDemoState();
}

class _CheckboxShakeDemoState extends State<CheckboxShakeDemo> with SingleTickerProviderStateMixin {
  bool _isChecked = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticIn,
      ),
    );
  }

  void _startShakeAnimation() {
    if (!_isChecked) {
      _controller.forward().then((_) {
        _controller.reverse();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Titreme Efekti'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_animation.value, 0),
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked = newValue!;
                      });
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startShakeAnimation,
              child: const Text('Gönder'),
            ),
          ],
        ),
      ),
    );
  }
}
Widget subtitleText() {
    return SizedBox(
      width: 300,
      height: 100,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Biz sizin telefon belginize ',
          style: const AppTextStyle.text()
              .sm()
              .regular()
              .copyWith(color: AppColors.neutral.shade500),
          children: <TextSpan>[
            TextSpan(
              text: 'OTP kodyny',
              style: const AppTextStyle.text()
                  .sm()
                  .semiBold()
                  .copyWith(color: AppColors.neutral.shade700),
            ),
            TextSpan(
              text: '  ugradarys! ',
              style: const AppTextStyle.text()
                  .sm()
                  .regular()
                  .withColor(AppColors.neutral.shade500),
            ),
          ],
        ),
      ),
    );
  }

