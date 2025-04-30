import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoColumn<T> {
  final int flex;
  final Widget header;
  final Widget Function(T item) itemBuilder;

  InfoColumn({
    required Widget header,
    required this.itemBuilder,
    this.flex = 1,
  }) : header = Padding(
         padding: EdgeInsets.symmetric(
           vertical: 12.h,
           horizontal: 8.w,
         ),
         child: header,
       );
}

class InfoTable<T> extends StatelessWidget {
  final List<InfoColumn<T>> columns;
  final List<T> items;

  final Color backgroundColor;

  const InfoTable({
    super.key,
    required this.columns,
    required this.items,
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:
                columns
                    .map(
                      (column) => Expanded(
                        flex: column.flex,
                        child: column.header,
                      ),
                    )
                    .toList(),
          ),

          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = items[index];
                return Column(
                  children: [
                    Row(
                      children:
                          columns
                              .map(
                                (column) => Expanded(
                                  flex: column.flex,
                                  child: column.itemBuilder(item),
                                ),
                              )
                              .toList(),
                    ),
                    const Divider(),
                  ],
                );
              },

              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
