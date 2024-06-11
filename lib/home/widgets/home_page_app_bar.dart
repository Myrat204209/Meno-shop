import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const AppSearchBar(),
      actions: [
        AppActionsButton(
          icon: Icons.notifications_none_outlined,
          onPressed: () {},
        ),
        AppActionsButton(
          icon: Icons.link,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                final TextEditingController urlController =
                    TextEditingController();
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: UITextField(
                        controller: urlController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        hintText: 'baseUrl input',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AppButton(
                      type: AppButtonType.standard,
                      text: 'Baseurl',
                      onTap: () {
                        Http().updateBaseUrl(urlController.text);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
      backgroundColor: UIColors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
