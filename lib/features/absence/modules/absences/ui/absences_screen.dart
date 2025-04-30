import 'package:dirasaty_admin/core/extension/date_formatter.extension.dart';
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
import 'package:dirasaty_admin/features/absence/data/model/absence_model.dart';
import 'package:dirasaty_admin/features/absence/modules/justification/logic/justification_cubit.dart';
import 'package:dirasaty_admin/features/absence/modules/justification/ui/absence_details_view.dart';
import 'package:dirasaty_admin/features/students/data/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/absences_cubit.dart';

part 'widget/header.dart';
part 'widget/pagination_indicator.dart';
part 'widget/absence_list.dart';

class AbsencesScreen extends StatelessWidget {
  const AbsencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AbsencesCubit, AbsencesState>(
      listener: (context, state) {
        state.onError(context.showErrorSnackbar);
      },
      child: Column(
        children: [
          _Header(),
          heightSpace(16),
          Expanded(child: _AbsencesList()),
          heightSpace(16),
          _PaginationIndicator(),
        ],
      ),
    );
  }
}
