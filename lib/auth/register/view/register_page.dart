import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/auth/Auth.dart';
import 'package:user_repository/user_repository.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: RegisterPage());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(
        userRepository: context.read<UserRepository>(),
      ),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RegisterForm(),
      ),
    );
  }
}
