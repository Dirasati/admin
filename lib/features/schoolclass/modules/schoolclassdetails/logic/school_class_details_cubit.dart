import 'package:flutter_bloc/flutter_bloc.dart';

part 'school_class_details_state.dart';

class SchoolClassDetailsCubit extends Cubit<SchoolClassDetailsState> {
  SchoolClassDetailsCubit() : super(SchoolClassDetailsState.initial());
}
