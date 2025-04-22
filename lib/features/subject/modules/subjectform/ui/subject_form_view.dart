import 'package:dirasaty_admin/core/constants/data.dart';
import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/extension/validator.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/check_box.dart';
import 'package:dirasaty_admin/core/shared/widgets/dropdown_field.dart';
import 'package:dirasaty_admin/core/shared/widgets/loading_widget.dart';
import 'package:dirasaty_admin/core/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/subject_form_cubit.dart';

part 'widget/form.dart';

class SubjectFormView extends StatelessWidget {
  const SubjectFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (SubjectFormCubit cubit) =>
          cubit.state.isLoading && !cubit.state.isLoaded,
    );
    return BlocListener<SubjectFormCubit, SubjectFormState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
        state.onSaved(context.back);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        width: 380.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24).r,
        ),
        child: isLoading ? const AppLoadingWidget() : const _Form(),
      ),
    );
  }
}
