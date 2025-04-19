import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/parent/data/dto/parents_filter.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:dirasaty_admin/features/parent/data/repository/parent_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'multi_parent_state.dart';

class MultiParentCubit extends Cubit<MultiParentState> {
  final _parentRepo = locator<ParentRepo>();

  final ParentsFilter _filter;

  MultiParentCubit(this._filter) : super(MultiParentState.initial());

  List<ParentModel> get parents => state._paginationResult.data;
  Pagination get pagination => state._paginationResult.pagination;
  ParentsFilter get filter => _filter;

  void firstPage() {
    _filter.firstPage();
    state._paginationResult.clear();

    emit(state._loading());

    loadParents();
  }

  void nextPage() {
    _filter.nextPage();
    emit(state._loading());

    loadParents();
  }

  void prevPage() {
    _filter.prevPage();
    emit(state._loading());

    loadParents();
  }

  void loadParents() async {
    emit(state._loading());

    final result = await _parentRepo.getParents(_filter);

    result.when(
      success: (result) => emit(state._loaded(result)),
      error: (error) => emit(state._error(error.message)),
    );
  }

  void add(ParentModel item) => emit(state._add(item));

  void remove(ParentModel item) async {
    emit(state._loading());

    final result = await _parentRepo.deleteParent(item);

    result.when(
      success: (result) => emit(state._remove(item)),
      error: (error) => emit(state._error(error.message)),
    );
  }

  void replace(ParentModel item) => emit(state._replace(item));
}
