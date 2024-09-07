import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final otpTimerStyle = const AppTextStyle.text().withColor(AppColors.secondary);

class OtpTimer extends HookWidget {
  const OtpTimer({
    super.key,
    this.otpTimer = 120,
  });

  final int otpTimer;

  @override
  Widget build(BuildContext context) {
    // Use useAnimationController instead of AnimationController
    final AnimationController controller = useAnimationController(
      duration: Duration(seconds: otpTimer),
    );

    // Start the controller
    useEffect(() {
      controller.forward();
      return controller.dispose;
    }, [controller]);

    return Countdown(
      animation: StepTween(
        begin: otpTimer,
        end: 0,
      ).animate(controller),
    ).centralize();
  }

  // Getter to compute the remaining time
  String get otpTimerValue {
    final int remainingTime = otpTimer - (otpTimer * useAnimationController().value).round();
    final Duration duration = Duration(seconds: remainingTime);
    return '${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }
}

class Countdown extends AnimatedWidget {
  final Animation<int>? animation;

  Countdown({
    super.key,
    this.animation,
  }) : super(listenable: animation!);

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation!.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    log('------------------------timerText--------------------------------');
    return Text(
      timerText,
      style: otpTimerStyle,
    );
  }
}
