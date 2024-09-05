// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meno_shop/l10n/l10n.dart';

class AppSearchBar extends HookWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isSearchEmpty = useState(true);
    final controller = useSearchController();
    return SearchBar(
      controller: controller,
      leading: Icon(
        Icons.search,
        color: AppColors.neutral.shade700,
      ),
      hintText: context.l10n.searching,
      trailing: <Widget>[
        if (!isSearchEmpty.value)
          Tooltip(
            message: 'Clear search',
            child: IconButton(
              onPressed: () {
                controller.clear();
                // context.read<ProductsBloc>().add(const ProductsSearchUpdated(''));
                isSearchEmpty.value = true;
              },
              icon: const Icon(Icons.clear_rounded),
            ),
          )
      ],
      onSubmitted: (String value) {
        // context.read<ProductsBloc>().add(ProductsSearchUpdated(value));
        isSearchEmpty.value = value.isEmpty;
      },
    );
    //   return SearchAnchor.bar(
    //     isFullScreen: false,
    //     barLeading: Icon(
    //       Icons.search,
    //       color: AppColors.neutral.shade700,
    //     ),
    //     barHintText: context.l10n.searching,
    //     barTrailing: <Widget>[
    //       if (!isSearchEmpty.value)
    //         Tooltip(
    //           message: 'Clear search',
    //           child: IconButton(
    //             onPressed: () {
    //               controller.clear();
    //               // context.read<ProductsBloc>().add(const ProductsSearchUpdated(''));
    //               isSearchEmpty.value = true;
    //             },
    //             icon: const Icon(Icons.clear_rounded),
    //           ),
    //         )
    //     ],
    //     onSubmitted: (String value) {
    //       // context.read<ProductsBloc>().add(ProductsSearchUpdated(value));
    //       isSearchEmpty.value = value.isEmpty;
    //     },
    //     suggestionsBuilder: (
    //       BuildContext context,
    //       SearchController controller,
    //     ) {
    //       return List<ListTile>.generate(5, (int index) {
    //         final String item = '$index';
    //         return ListTile(
    //           title: Text(item),
    //           onTap: () {
    //             controller.closeView(item);
    //           },
    //         );
    //       });
    //     },
    //   );
  }
}
