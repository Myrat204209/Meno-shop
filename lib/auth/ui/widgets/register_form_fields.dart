part of 'register_form.dart';

/// Phone input field

class _PhoneInput extends StatefulWidget {
  const _PhoneInput();

  @override
  State<_PhoneInput> createState() => __PhoneInputState();
}

class __PhoneInputState extends State<_PhoneInput> {
  final _controller = TextEditingController();
  @override
  void initState() {
    _controller.addListener(() {
      final phone = _controller.text;
      context.read<RegisterBloc>().add(RegisterPhoneChanged('993$phone'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RegisterBloc>().state;
    return UIPhoneTextField(
      key: const Key('registerForm_phoneInput_textField'),
      controller: _controller,
      readOnly: state.status.isInProgress,
      labelText: 'Phone',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// Register button

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RegisterBloc>().state;
    return ElevatedButton(
      key: const Key('registerForm_registerButton'),
      onPressed: state.isValid
          ? () => context.read<RegisterBloc>().add(RegisterStarted())
          : null,
      child: state.status.isInProgress
          ? const SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator(),
            )
          : const Text('Register'),
    );
  }
}
