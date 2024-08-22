import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/features/l10n/l10n.dart';
import 'package:meno_shop/features/language/language.dart';

Future<void> showLanguageSelectBottomSheet({
  required BuildContext context,
}) async =>
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) => const LanguageSelectBottomSheet(),
    );

class LanguageSelectBottomSheet extends StatelessWidget {
  const LanguageSelectBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
      ).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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
                  Future.delayed(const Duration(milliseconds: 100))
                      .then((value) => Navigator.of(context).pop());
                },
                title: Text(
                  switch (locale.languageCode) {
                    'ru' => 'Русский язык',
                    'tk' => 'Türkmen dili',
                    'en' => 'English',
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
      ),
    );
  }
}
