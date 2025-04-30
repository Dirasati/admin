import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaginationIndicator extends StatelessWidget {
  final Pagination pagination;

  final VoidCallback? onNext;
  final VoidCallback? onPrev;

  const PaginationIndicator({
    super.key,
    required this.pagination,
    this.onNext,
    this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16).r,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            isActivated: pagination.prev != null,
            onPressed: pagination.prev != null ? onPrev : null,
            icon: AppIcons.keyboard_arrow_left,
          ),
          widthSpace(32),

          Text(
            pagination.page?.toString() ?? '',
            style: AppTextStyles.xLarge.copyWith(
              color: AppColors.black,
            ),
          ),

          widthSpace(32),
          _buildButton(
            isActivated: pagination.next != null,
            onPressed: pagination.next != null ? onNext : null,
            icon: AppIcons.keyboard_arrow_right,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required bool isActivated,
    required VoidCallback? onPressed,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Icon(
        icon,
        color: isActivated ? AppColors.primary : AppColors.grey,
        size: 24.r,
      ),
    );
  }
}
