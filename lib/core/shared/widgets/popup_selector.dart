import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopupSelector<T> extends StatelessWidget {
  final Widget widget;

  final List<T> Function(BuildContext context) itemsBuilder;

  final Widget Function(T) itemToWidget;
  final ValueChanged<T> onItemSelected;

  final TextEditingController searchController;
  final ValueChanged<String> onSearch;

  final void Function(BuildContext context) onAdd;

  const PopupSelector({
    super.key,
    required this.widget,
    required this.itemsBuilder,
    required this.itemToWidget,
    required this.onItemSelected,
    required this.searchController,
    required this.onSearch,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      onSelected: (value) => onItemSelected(value),
      borderRadius: BorderRadius.circular(16).r,
      color: Colors.white,
      menuPadding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 8.h,
      ),
      constraints: BoxConstraints(minWidth: 380.w),

      itemBuilder:
          (context) => [
            PopupMenuItem(
              enabled: false,
              padding: EdgeInsets.zero,
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

            const PopupMenuDivider(),

            PopupMenuItem(
              enabled: false,

              padding: EdgeInsets.zero,
              child: Center(
                child: AppButton.hyperLink(
                  text: 'AddNew'.tr(context),
                  onPressed: () => onAdd(context),
                ),
              ),
            ),
          ],

      child: widget,
    );
  }
}
