import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/language/language.dart';

class LanguageBottomSheetContent extends StatelessWidget {
  const LanguageBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Text(
          l10n.languageChangeTitle,
          style: const AppTextStyle.text().headline6().semiBold(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),
        ...AppLocalizations.supportedLocales.map(
          (locale) {
            return LanguageListTile(
              languageName: locale.languageCode,
              onChanged: (value) {
                context.read<LanguageBloc>().add(LanguageChanged(locale));
                Future.delayed(const Duration(milliseconds: 50));
                context.pop();
              },
              title: Text(
                switch (locale.languageCode) {
                  'tk' => 'Türkmen dili',
                  'ru' => 'Русский язык',
                  String() => '',
                },
                style: const AppTextStyle.text()
                    .regular()
                    .sm()
                    .withColor(Colors.black),
              ),
              value: locale.languageCode,
              groupValue: context.read<LanguageBloc>().state.languageCode,
            );
          },
        ),
      ],
    );
  }
}
