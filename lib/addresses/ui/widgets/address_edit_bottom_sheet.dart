import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meno_shop/addresses/address.dart';
import 'package:meno_shop/l10n/l10n.dart';

class AddressEditBottomSheet extends HookWidget {
  const AddressEditBottomSheet({
    this.address,
    super.key,
  });

  final AddressModel? address;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>(); // Added form key
    final nameController = useTextEditingController(text: address?.name);
    final addressController = useTextEditingController(text: address?.address);
    final addressNameController =
        useTextEditingController(text: address?.addressName);
    final phoneNumberController =
        useTextEditingController(text: address?.phoneNumber);

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UITextField(
            controller: addressNameController,
            hintText: 'Şu ýere salgyňyzyň adyny girizin',
            labelText: context.l10n.addressName,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Address Name cannot be empty';
              }
              return null;
            },
          ),

          const SizedBox(height: AppSpacing.md),
          UITextField(
            controller: phoneNumberController,
            labelText: context.l10n.phoneNumber,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(8),
            ],
            autocorrect: false,
            prefixText: '+993 ',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phone Number cannot be empty';
              }
              return null;
            },
          ),

          const SizedBox(height: AppSpacing.md),

          UITextField(
            controller: nameController,
            hintText: 'Şu ýere adyňyzy girizin',
            labelText: context.l10n.name,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name cannot be empty';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.md),
          UITextField(
            controller: addressController,
            hintText: 'Şu ýere salgyňyzy girizin',
            labelText: context.l10n.address,
            keyboardType: TextInputType.multiline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Addressi dolduruň';
              }
              return null;
            },
          ),

          const SizedBox(height: AppSpacing.md),

          /// CONFIRM BUTTON
          SizedBox(
            height: 40,
            child: AppButton.expanded(
              onTap: () {
                if (formKey.currentState?.validate() ?? false) {
                  if (address == null &&
                      nameController.text != '' &&
                      addressNameController.text != '' &&
                      addressNameController.text != '' &&
                      phoneNumberController.text != "") {
                    context.read<AddressBloc>().add(
                          AddressCreateRequested(
                            AddressModel(
                              name: nameController.text,
                              address: addressController.text,
                              phoneNumber: phoneNumberController.text,
                              addressName: '',
                            ),
                          ),
                        );
                  } else {
                    context.read<AddressBloc>().add(
                          AddressUpdateRequested(
                            AddressModel(
                              uuid: address?.uuid,
                              addressName: addressNameController.text,
                              name: nameController.text,
                              phoneNumber: phoneNumberController.text,
                              address: addressController.text,
                            ),
                          ),
                        );
                  }
                }

                Navigator.pop(context);
              },
              buttonText: address == null
                  ? context.l10n.addressesCreate
                  : 'Addresi üýtget',
            ),
          ),
        ],
      ),
    );
  }
}
