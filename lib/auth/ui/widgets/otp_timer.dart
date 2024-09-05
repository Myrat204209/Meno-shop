import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final otpTimerStyle = const AppTextStyle.text().withColor(AppColors.secondary);

class OtpTimer extends HookWidget {
  const OtpTimer({super.key});

  @override
  Widget build(BuildContext context) {
    const int otpTimer = 120;

    // Use useAnimationController instead of AnimationController
    final AnimationController controller = useAnimationController(
      duration: const Duration(seconds: otpTimer),
    );

    // Start the controller
    useEffect(() {
      controller.forward();
      return controller.dispose;
    }, [controller]);

    return Countdown(
      animation: StepTween(
        begin: otpTimer, // This is a user-entered number
        end: 0,
      ).animate(controller),
    ).centralize();
  }
}

class Countdown extends AnimatedWidget {
  final Animation<int>? animation;

  Countdown({
    super.key,
    this.animation,
  }) : super(listenable: animation!);

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation!.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: otpTimerStyle,
    );
  }
}
