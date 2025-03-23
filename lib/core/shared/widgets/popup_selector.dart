import 'package:dirasaty_admin/core/shared/widgets/search_field.dart';
import 'package:flutter/material.dart';

class PopupSelector<T> extends StatelessWidget {
  final Widget widget;

  final List<T> Function(BuildContext context) itemsBuilder;

  final Widget Function(T) itemToWidget;
  final ValueChanged<T> onItemSelected;

  final TextEditingController searchController;
  final ValueChanged<String> onSearch;

  const PopupSelector({
    super.key,
    required this.widget,
    required this.itemsBuilder,
    required this.itemToWidget,
    required this.onItemSelected,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      onSelected: (value) => onItemSelected(value),
      itemBuilder:
          (context) => [
            PopupMenuItem(
              child: AppSearchField(
                controller: searchController,
                onSearch: onSearch,
              ),
            ),

            const PopupMenuDivider(),

            ...itemsBuilder(context).map((item) {
              return PopupMenuItem<T>(
                value: item,
                child: itemToWidget(item),
              );
            }),
          ],

      child: widget,
    );
  }
}
