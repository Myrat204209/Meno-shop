import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/features/addresses/address.dart';
import 'package:meno_shop/features/l10n/l10n.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final addressCount =
        context.select((AddressBloc bloc) => bloc.state.addresses);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text('${addressCount.length}/4').paddingOnly(right: 10),
        ],
        title: Text(context.l10n.addresses),
        centerTitle: true,

        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       showModalBottomSheet(
        //         context: context,
        //         isScrollControlled: true,
        //         builder: (_) => const AddressEditBottomSheet(),
        //       );
        //     },
        //     icon: const Icon(Icons.add_rounded),
        //   ),
        // ],
      ),
      body: const AddressesContent(),
    );
  }
}
