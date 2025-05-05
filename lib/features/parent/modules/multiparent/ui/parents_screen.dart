import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/snackbar.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/info_table.dart';
import 'package:dirasaty_admin/core/shared/widgets/loading_widget.dart';
import 'package:dirasaty_admin/core/shared/widgets/pagination_indicator.dart';
import 'package:dirasaty_admin/core/shared/widgets/search_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:dirasaty_admin/features/parent/modules/multiparent/logic/multi_parent_cubit.dart';
import 'package:dirasaty_admin/features/parent/modules/parentform/logic/parent_form_cubit.dart';
import 'package:dirasaty_admin/features/parent/modules/parentform/ui/parent_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widgets/header.dart';
part 'widgets/pagination_indicator.dart';
part 'widgets/parents_list.dart';

class ParentsScreen extends StatelessWidget {
  const ParentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MultiParentCubit, MultiParentState>(
      listener: (context, state) {
        state.onError(context.showErrorSnackbar);
      },
      child: Column(
        children: [
          _Header(),
          heightSpace(16),
          Expanded(child: _ParentsList()),
          heightSpace(16),
          _PaginationIndicator(),
        ],
      ),
    );
  }
}
