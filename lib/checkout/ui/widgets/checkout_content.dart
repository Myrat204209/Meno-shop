import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meno_shop/checkout/checkout.dart';


class CheckoutContent extends HookWidget {
  const CheckoutContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
        (CheckoutBloc bloc) => bloc.state.status == CheckoutStatus.loading);

    final notesController = useTextEditingController();

    final isAddressSelected = useState<bool?>(null);

    final formKey = useMemoized(() => GlobalKey<FormState>());

    if (isLoading) {
      return const AppLoadingIndicator();
    }
    return Form(
      key: formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [

                const SizedBox(height: AppSpacing.md),

                /// ADDRESS
                CheckoutAddressField(
                  error: switch (isAddressSelected.value) {
                    false => 'Hokmany doldurmaly',
                    _ => null,
                  },
                ),

                const SizedBox(height: AppSpacing.md),

                // / NOTES
                CheckoutNotesField(controller: notesController),

                const SizedBox(height: AppSpacing.md),

                /// PAYMENT METHODS
                // const CheckoutPaymentMethodSelector(),

                const SizedBox(height: AppSpacing.md),

                /// DELIVERY TYPES
                // const CheckoutDeliveryTypeSelector(),
              ],
            ),
          ),

          /// FOOTER
          // CartFooter(
          //   onSubmit: () {
          //     bool hasError = false;

          //     /// validate inputs
          //     if (!(_formKey.currentState?.validate() ?? false)) {
          //       hasError = true;
          //     }

          //     /// check address
          //     final address = context.read<AddressBloc>().state.selectedAddress;
          //     if (address == null) {
          //       isAddressSelected.value = false;
          //       hasError = true;
          //     } else {
          //       isAddressSelected.value = true;
          //     }

          //     // stop if there any error
          //     if (hasError) return;

          //     // complete checkout
          //     context.read<CheckoutBloc>().add(
          //           CheckoutCompleteRequested(
          //             // username: usernameController.text,
          //             phone: phoneController.text,
          //             address: address!.address,
          //             notes: notesController.text,
          //           ),
          //         );
          //   },
          // ),
        ],
      ),
    );
  }
}
