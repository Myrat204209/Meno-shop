import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:meno_shop/auth/auth.dart';
import 'package:meno_shop/auth/ui/bloc/login_bloc.dart';

part 'login_form_fields.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(
              content: Text('Login Failure'),
            ));
        }
      },
      child: const _LoginContent(),
    );
  }
}

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5),
                const _PhoneInput(),
                const SizedBox(height: 10),
                const _LoginButton(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ));
                  },
                  child: const Text('Not registered? Register here..'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
