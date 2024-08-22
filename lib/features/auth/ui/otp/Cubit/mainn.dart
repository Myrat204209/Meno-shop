import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/features/auth/ui/otp/Cubit/phone_cubit.dart';
import 'package:meno_shop/features/auth/ui/login_page/login_page.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => PhoneCubit(),
        child: const LoginPage(),
      ),
    );
  }
}
