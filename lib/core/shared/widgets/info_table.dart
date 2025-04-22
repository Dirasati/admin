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
           vertical: 10.h,
           horizontal: 10.w,
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
      padding: EdgeInsets.symmetric(horizontal: 4.w),
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
          const Divider(),

          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final item = items[index];
                return Row(
                  children:
                      columns
                          .map(
                            (column) => Expanded(
                              flex: column.flex,
                              child: column.itemBuilder(item),
                            ),
                          )
                          .toList(),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
