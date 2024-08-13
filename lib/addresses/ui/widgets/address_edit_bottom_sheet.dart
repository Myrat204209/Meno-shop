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
    final nameController = useTextEditingController(text: address?.name);
    final addressController = useTextEditingController(text: address?.address);
    final addressNameController =
        useTextEditingController(text: address?.addressName);
    final phoneNumberController =
        useTextEditingController(text: address?.phoneNumber);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xlg,
      ).copyWith(
          bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UITextField(
            controller: addressNameController,
            hintText: 'Enter your address name here',
            labelText: 'Address Name',
            keyboardType: TextInputType.name,
            // onChanged: (value) {},
            // onSubmitted: (value) {},
          ),

          /// NAME
          // TextFormField(
          //   controller: nameController,
          //   keyboardType: TextInputType.text,
          //   decoration: const InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: "Ady",
          //     suffixIcon: Icon(Icons.map),
          //     // errorText: error,
          //   ),
          // ),

          const SizedBox(height: AppSpacing.md),
          UITextField(
            controller: phoneNumberController,
            labelText: context.l10n.phoneNumber,
            // controller: controller,
            keyboardType: TextInputType.phone,
            // maxLength: 8,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(8),
            ],
            autocorrect: false,
            prefixText: '+993 ',
            // onChanged: onChanged,
            // suffix: suffix,
            // errorText: errorText,
            // onSubmitted: onSubmitted,
          ),

          /// Phone Number
          // TextFormField(
          //   controller: phoneNumberController,
          //   keyboardType: TextInputType.phone,
          //   maxLines: null,
          //   decoration: const InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: "Telefon nomeri",
          //     suffixIcon: Icon(Icons.phone),
          //   ),
          // ),
          const SizedBox(height: AppSpacing.md),

          /// ADDRESS
          // TextFormField(
          //   controller: addressController,
          //   keyboardType: TextInputType.text,
          //   maxLines: 4,
          //   decoration: const InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: "Salgysy",
          //     suffixIcon: Icon(Icons.location_on_outlined),
          //   ),
          // ),

          const SizedBox(height: AppSpacing.md),
          UITextField(
            controller: nameController,
            hintText: 'Enter your name here',
            labelText: context.l10n.name,
            keyboardType: TextInputType.name,
            onChanged: (value) {},
            onSubmitted: (value) {},
          ),
          const SizedBox(height: AppSpacing.md),
          UITextField(
            controller: addressController,
            hintText: 'Enter your address here',
            labelText: context.l10n.name,
            keyboardType: TextInputType.multiline,
            onChanged: (value) {},
            onSubmitted: (value) {},
          ),

          /// CONFIRM BUTTON
          SizedBox(
            height: 40,
            child: AppButton.expanded(
              onTap: () {
                if (address == null) {
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
                Navigator.pop(context);
              },
              buttonText: context.l10n.addressesCreate,
            ),
          ),
        ],
      ),
    );
  }
}
