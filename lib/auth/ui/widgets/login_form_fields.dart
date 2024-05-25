part of 'login_form.dart';

/// Password input field
class _PhoneInput extends StatefulWidget {
  const _PhoneInput();

  @override
  State<_PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<_PhoneInput> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      final phone = _controller.text;
      context.read<LoginBloc>().add(LoginPhoneChanged('993$phone'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;

    return UIPasswordTextField(
      key: const Key('loginForm_phoneInput_textField'),
      controller: _controller,
      labelText: 'Phone',
      readOnly: state.status.isInProgress,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// Login button
class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.onSecondary),
      key: const Key('loginForm_loginButton'),
      onPressed: state.valid
          ? () => context.read<LoginBloc>().add(LoginPhoneSubmitted())
          : null,
      child: state.status.isInProgress
          ? const SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator(
                  // color: Theme.of(context).colorScheme.inversePrimary,
                  ),
            )
          : const Text('Login'),
    );
  }
}
