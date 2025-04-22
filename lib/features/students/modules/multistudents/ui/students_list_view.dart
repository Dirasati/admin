import 'package:dirasaty_admin/core/extension/date_formatter.extension.dart';
import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/snackbar.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/info_table.dart';
import 'package:dirasaty_admin/core/shared/widgets/search_field.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/students/data/model/student_model.dart';
import 'package:dirasaty_admin/features/students/modules/multistudents/logic/multi_students_cubit.dart';
import 'package:dirasaty_admin/features/students/modules/studentform/logic/student_form_cubit.dart';
import 'package:dirasaty_admin/features/students/modules/studentform/ui/student_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widget/header.dart';
part 'widget/students_list.dart';
part 'widget/pagination_indicator.dart';

class StudentsListView extends StatelessWidget {
  const StudentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentsListCubit, StudentsListState>(
      listener: (context, state) {
        state.onError(context.showErrorSnackbar);
      },
      child: Column(
        children: [
          _Header(),
          heightSpace(16),
          Expanded(child: _StudentsList()),
          heightSpace(16),
          _PaginationIndicator(),
        ],
      ),
    );
  }
}
