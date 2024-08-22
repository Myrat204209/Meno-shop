import 'dart:async';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/features/auth/ui/otp/widgets/otp_page_header.dart';
import 'package:meno_shop/features/auth/ui/otp/widgets/otp_pin_input_form.dart';
import 'package:meno_shop/features/auth/ui/otp/widgets/otp_resend_code_link.dart';
import 'package:meno_shop/features/auth/ui/otp/widgets/otp_timer.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({super.key, required this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  //String validpin = "1234";  // Doğrulama için kullanılacak geçerli PIN
  int _start = 60; // Başlangıçta 60 saniye
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: BackButton(),
                  ),
                  SizedBox(height: size.height * 0.2),
                  OtpPageHeader(phoneNumber: widget.phoneNumber),
                  SizedBox(height: size.height * 0.03),
                  OtpPinInputForm(
                    phoneNumber:
                        widget.phoneNumber, // Burada phoneNumber'ı ilettik
                  ),
                  SizedBox(height: size.height * 0.03),
                  OtpTimer(start: _start, formatTime: formatTime),
                  SizedBox(height: size.height * 0.18),
                  const OtpResendCodeLink(),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    height: 50,
                    width: 340,
                    child: AppButton(
                      buttonText: 'OK',
                      onTap: () {
                        // Doğrulama işlemi burada yapılabilir
                        // Örneğin, OTP doğrulama için API çağrısı yapılabilir
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
