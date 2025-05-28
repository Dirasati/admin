import 'package:dirasaty_admin/core/extension/date_formatter.extension.dart';
import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/snackbar.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/info_table.dart';
import 'package:dirasaty_admin/core/shared/widgets/loading_widget.dart';
import 'package:dirasaty_admin/core/shared/widgets/pagination_indicator.dart';
import 'package:dirasaty_admin/core/shared/widgets/search_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/features/parent/data/dto/parents_filter.dart';
import 'package:dirasaty_admin/features/parent/modules/multiparent/logic/multi_parent_cubit.dart';
import 'package:dirasaty_admin/features/payment/data/dto/payment_dto.dart';
import 'package:dirasaty_admin/features/payment/data/models/tuition_fee_model.dart';
import 'package:dirasaty_admin/features/payment/tuitionfees/logic/tuition_fees_cubit.dart';
import 'package:dirasaty_admin/features/payment/tuitionfees/ui/widget/payment_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widget/header.dart';
part 'widget/pagination_indicator.dart';
part 'widget/tuition_fee_list.dart';

class TuitionFeeScreen extends StatelessWidget {
  const TuitionFeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TuitionFeesCubit, TuitionFeesState>(
      listener: (context, state) {
        state.onError(context.showErrorSnackbar);
      },
      child: Column(
        children: [
          _Header(),
          heightSpace(16),
          Expanded(child: _TuitionFeeList()),
          heightSpace(16),
          _PaginationIndicator(),
        ],
      ),
    );
  }
}
