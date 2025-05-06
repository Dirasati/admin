part of 'admins_cubit.dart';

enum _AdminsStatus { initial, loading, loaded, error }

class AdminsState extends ErrorCubitState {
  final PaginationResult<AdminModel> _result;
  final _AdminsStatus status;

  AdminsState({
    required PaginationResult<AdminModel> result,
    _AdminsStatus? status,
    String? error,
  })  : _result = result,
        status = status ?? _AdminsStatus.initial,
        super(error);

  factory AdminsState.initial() => AdminsState(
        result: PaginationResult(),
        status: _AdminsStatus.initial,
      );

  AdminsState _copyWith({
    PaginationResult<AdminModel>? result,
    _AdminsStatus? status,
    String? error,
  }) {
    return AdminsState(
      result: result ?? _result,
      status: status ?? this.status,
      error: error,
    );
  }

  bool get isLoading => status == _AdminsStatus.loading;

  AdminsState _loading() => _copyWith(status: _AdminsStatus.loading);

  AdminsState _loaded(PaginationResult<AdminModel> result) =>
      _copyWith(result: result, status: _AdminsStatus.loaded);

  AdminsState _add(AdminModel admin) => _copyWith(
        result: _result.addFirst(admin)..data.removeLast(),
        status: _AdminsStatus.loaded,
      );

  AdminsState _update(AdminModel admin) => _copyWith(
        result: _result.replace(admin),
        status: _AdminsStatus.loaded,
      );

  AdminsState _delete(AdminModel admin) => _copyWith(
        result: _result.remove(admin),
        status: _AdminsStatus.loaded,
      );

  AdminsState _error(String error) =>
      _copyWith(status: _AdminsStatus.error, error: error);
}
