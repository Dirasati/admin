import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/snackbar.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/search_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/schoolclass/data/model/school_class_model.dart';
import 'package:dirasaty_admin/features/schoolclass/modules/schoolclasses/logic/school_classes_cubit.dart';
import 'package:dirasaty_admin/features/schoolclass/modules/schoolclassform/logic/school_class_form_cubit.dart';
import 'package:dirasaty_admin/features/schoolclass/modules/schoolclassform/ui/school_class_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widget/header.dart';
part 'widget/classes_list.dart';

class SchoolClassesScreen extends StatelessWidget {
  const SchoolClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Header(),
        heightSpace(12),
        const _ClassesList(),
      ],
    );
  }
}
