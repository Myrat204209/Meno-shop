import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/addresses/address.dart';
import 'package:meno_shop/l10n/l10n.dart';

class AddressesContent extends StatelessWidget {
  const AddressesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses =
        context.select((AddressBloc bloc) => bloc.state.addresses);
    final isLoading = context.select(
        (AddressBloc bloc) => bloc.state.status == AddressStatus.loading);

    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        return

            /// Addresses
            ListView.separated(
          itemCount: addresses.length + 1,
          padding: const EdgeInsets.all(AppSpacing.md),
          itemBuilder: (context, index) {
            if (isLoading) const AppLoadingIndicator(isForeground: true);
            if (index == addresses.length || addresses.isEmpty) {
              return SizedBox(
                height: 40,
                child: AppButton.expanded(
                  buttonText: context.l10n.addressesCreate,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => const AddressEditBottomSheet(),
                    );
                  },
                ),
              );
            } else {
              final address = addresses[index];
              return AddressCard(
                address: address,
                onPressed: () {
                  context.read<AddressBloc>().add(AddressSelected(address));
                },
                onEditPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => AddressEditBottomSheet(address: address),
                  );
                },
              );
            }
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.md),
        );

        /// Loading indicator
      },
    );
  }
}
