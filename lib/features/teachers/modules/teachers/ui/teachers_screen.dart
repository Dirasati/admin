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
import 'package:dirasaty_admin/features/teachers/data/model/teacher_model.dart';
import 'package:dirasaty_admin/features/teachers/modules/teacherform/logic/teacher_form_cubit.dart';
import 'package:dirasaty_admin/features/teachers/modules/teacherform/ui/teacher_form_view.dart';
import 'package:dirasaty_admin/features/teachers/modules/teachers/logic/teachers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widget/header.dart';
part 'widget/pagination_indicator.dart';
part 'widget/teachers_list.dart';

class TeachersScreen extends StatelessWidget {
  const TeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TeachersCubit, TeachersState>(
      listener: (context, state) {
        state.onError(context.showErrorSnackbar);
      },
      child: Column(
        children: [
          _Header(),
          heightSpace(16),
          Expanded(child: _TeachersList()),
          heightSpace(16),
          _PaginationIndicator(),
        ],
      ),
    );
  }
}
