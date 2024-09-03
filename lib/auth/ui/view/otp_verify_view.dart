// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/auth/auth.dart';

class OtpVerifyView extends StatelessWidget {
  const OtpVerifyView({
    super.key,
    required this.phone,
  });
  final String phone;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.isAuthenticated == true) {
          context.goNamed(RouteNames.home.name);
        }
      },
      child: OtpVerifyContent(phone: phone),
    );
  }
}
