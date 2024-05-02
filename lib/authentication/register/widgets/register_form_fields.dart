part of 'register_form.dart';

/// Name input field
class _NameInput extends StatefulWidget {
  const _NameInput();

  @override
  State<_NameInput> createState() => __NameInputState();
}

class __NameInputState extends State<_NameInput> {
  final _controller = TextEditingController();
  @override
  void initState() {
    _controller.addListener(() {
      final name = _controller.text;
      context.read<RegisterBloc>().add(RegisterNameChanged(name));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RegisterBloc>().state;
    return UINameTextField(
      key: const Key('registerForm_nameInput_textField'),
      controller: _controller,
      labelText: 'Name',
      readOnly: state.status.isInProgress,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// Surname input field
class _SurnameInput extends StatefulWidget {
  const _SurnameInput();

  @override
  State<_SurnameInput> createState() => _SurnameInputState();
}

class _SurnameInputState extends State<_SurnameInput> {
  final _controller = TextEditingController();
  @override
  void initState() {
    _controller.addListener(() {
      final surname = _controller.text;
      context.read<RegisterBloc>().add(RegisterSurnameChanged(surname));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RegisterBloc>().state;
    return UINameTextField(
      key: const Key('registerForm_surnameInput_textField'),
      controller: _controller,
      labelText: 'Surname',
      readOnly: state.status.isInProgress,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

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
