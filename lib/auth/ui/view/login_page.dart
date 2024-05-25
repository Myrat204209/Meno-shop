import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/auth/ui/bloc/login_bloc.dart';
import 'package:meno_shop/auth/ui/widgets/login_form.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        authRepository: ,
      ),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: const SafeArea(
        child: LoginForm(),
      ),
    );
  }
}
