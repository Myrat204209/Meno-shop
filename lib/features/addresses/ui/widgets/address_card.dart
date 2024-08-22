import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    required this.address,
    super.key,
    this.onEditPressed,
    this.onPressed,
  });

  final AddressModel address;
  final VoidCallback? onEditPressed;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onPressed: onPressed,
      leading: const Icon(Icons.location_on, color: AppColors.primary),
      title: Text(
        address.name,
        style: const AppTextStyle.text().lg().bold(),
      ),
      subtitle: Text(
        '''${address.name}\n${address.phoneNumber}\n${address.address}
        ''',
        style: const AppTextStyle.text().sm().regular(),
      ),
      trailing: IconButton(
        onPressed: onEditPressed,
        icon: const Icon(
          Icons.more_vert,
          color: AppColors.primary,
        ),
      ),
      isThreeLine: true,
    );
  }
}
