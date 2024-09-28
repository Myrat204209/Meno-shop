import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/addresses/address.dart';

class CheckoutAddressField extends StatelessWidget {
  const CheckoutAddressField({
    super.key,
    this.error,
  });

  final String? error;

  @override
  Widget build(BuildContext context) {
    final address =
        context.select((AddressBloc bloc) => bloc.state.selectedAddress);

    return InkWell(
      onTap: () => {},
      //  Navigator.of(context).push(AddressPage.route(
      //   onAddressSelected: (address) {
      //     Navigator.of(context).pop();
      //   },
      // )),
      child: Ink(
        child: InputDecorator(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Ertip bermeli adresiniz",
            suffixIcon: const Icon(Icons.pin_drop_outlined),
            errorText: error,
          ),
          child: Text(
            address?.address ?? 'Select address',
            style: const TextStyle(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
