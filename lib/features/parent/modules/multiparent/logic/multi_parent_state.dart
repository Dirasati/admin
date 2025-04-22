// ignore_for_file: library_private_types_in_public_api

part of 'multi_parent_cubit.dart';

enum _MultiParentStatus { initial, loading, loaded, error }

class MultiParentState extends ErrorCubitState {
  final PaginationResult<ParentModel> _paginationResult;
  final _MultiParentStatus _status;

  MultiParentState({
    required PaginationResult<ParentModel> paginationResult,
    _MultiParentStatus? status,
    String? error,
  }) : _paginationResult = paginationResult,
       _status = status ?? _MultiParentStatus.initial,
       super(error);

  bool get isLoading => _status == _MultiParentStatus.loading;

  factory MultiParentState.initial() => MultiParentState(
    paginationResult: PaginationResult<ParentModel>(),
    status: _MultiParentStatus.initial,
  );

  MultiParentState _loading() =>
      _copyWith(status: _MultiParentStatus.loading);

  MultiParentState _loaded(PaginationResult<ParentModel> result) =>
      _copyWith(
        paginationResult: result,
        status: _MultiParentStatus.loaded,
      );

  MultiParentState _error(String error) =>
      _copyWith(status: _MultiParentStatus.error, error: error);

  MultiParentState _add(ParentModel item) =>
      _copyWith(paginationResult: _paginationResult.add(item));

  // MultiParentState _addAll(PaginationResult<ParentModel> result) =>
  //     _copyWith(paginationResult: _paginationResult.addAll(result));

  MultiParentState _remove(ParentModel item) =>
      _copyWith(paginationResult: _paginationResult.remove(item));

  MultiParentState _replace(ParentModel item) =>
      _copyWith(paginationResult: _paginationResult.replace(item));

  MultiParentState _copyWith({
    PaginationResult<ParentModel>? paginationResult,
    _MultiParentStatus? status,
    String? error,
  }) {
    return MultiParentState(
      paginationResult: paginationResult ?? _paginationResult,
      status: status ?? _status,
      error: error,
    );
  }
}
