import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/features/auth/ui/otp/Cubit/phone_cubit.dart';
import 'package:meno_shop/features/auth/ui/login_page/widgets/back_button_view.dart';
import 'package:meno_shop/features/auth/ui/login_page/widgets/heading_text_view.dart';
import 'package:meno_shop/features/auth/ui/login_page/widgets/phone_number_view.dart';
import 'package:meno_shop/features/auth/ui/login_page/widgets/private_policy_view.dart';
import 'package:meno_shop/features/auth/ui/login_page/widgets/subtitle_view.dart';
import 'package:meno_shop/features/auth/ui/otp/otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  bool _isChecked = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCheckbox(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
  }

  void _handleSubmit() {
    if (_isChecked && _formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtpPage(phoneNumber: controller.text)),
      );
    } else {
      // Shake animasyonunu başlat
      _animationController.forward().then((_) {
        _animationController.reverse();
      });
    }
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
                  BackButtonWidget(onPressed: () => Navigator.pop(context)),
                  SizedBox(height: size.height * 0.25),
                  const HeadingText(),
                  SizedBox(height: size.height * 0.01),
                  const SubtitleText(),
                  SizedBox(height: size.height * 0.01),
                  PhoneNumberForm(formKey: _formKey, controller: controller),
                  SizedBox(height: size.height * 0.02),
                  PrivatePolicyForm(
                    isChecked: _isChecked,
                    onCheckboxChanged: _toggleCheckbox,
                    animationController: _animationController,
                  ),
                  SizedBox(height: size.height * 0.18),
                  BlocConsumer<PhoneCubit, PhoneState>(
                    listener: (context, state) {
                      if (state is PhoneSentSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Numara başarıyla gönderildi!')),
                        );
                      } else if (state is PhoneSentFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Hata: ${state.error}')),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is PhoneSending) {
                        return const CircularProgressIndicator();
                      }
                      return SizedBox(
                        height: 50,
                        width: 328,
                        child: AppButton(
                          buttonText: 'Get code',
                          onTap: () {
                            _handleSubmit();

                            if (_isChecked) {
                              // Checkbox işaretli mi kontrol ediliyor
                              final phoneNumber = controller.text;
                              if (phoneNumber.isNotEmpty) {
                                context
                                    .read<PhoneCubit>()
                                    .sendPhoneNumber(phoneNumber);
                              }
                            }
                          },
                        ),
                      );
                    },
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
