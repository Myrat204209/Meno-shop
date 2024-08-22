
// PhoneNumberForm.dart
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';






class PhoneNumberForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  const PhoneNumberForm({super.key, required this.formKey, required this.controller});

  @override
  State<PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm>   {


  //final notificationService = NotificationService();
 //final socketService = SocketService(notificationService: notificationService);


  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.controller,
            decoration: const InputDecoration(
              labelText: 'Telefon belginizi girizin',
              prefixText: '+993',
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(8),
            ],
            autocorrect: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nomerinizi girizin';
              } else if (value.length != 8) {
                return 'Telefon belgin 8 den az bolmaly dal';
              }
              return null;
            },
          ).paddingSymmetric(horizontal: 10),

      
        ],
      ),
    );
  }
}
