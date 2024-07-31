// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/addresses/address.dart';

typedef AddressSelectCallback = void Function(AddressModel address);

class AddressPage extends StatelessWidget {
  const AddressPage({
    super.key,
    this.onAddressSelected,
  });
  final AddressSelectCallback? onAddressSelected;

  @override
  Widget build(BuildContext context) {
    return const AddressView();
    // BlocListener<AddressBloc, AddressState>(
    //   listenWhen: (previous, current) =>
    //       previous.selectedAddress != current.selectedAddress,
    //   listener: (context, state) {
    //     if (state.selectedAddress == null) return;
    //     onAddressSelected?.call(state.selectedAddress!);
    //   },
    //   child: const AddressView(),
    // );
  }
}
