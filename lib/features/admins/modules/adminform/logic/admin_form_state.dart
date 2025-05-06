part of 'admin_form_cubit.dart';

enum _AdminFormStatus { initial, loading, loaded, saved, error }

class AdminFormState<T extends AdminDTO> extends ErrorCubitState {
  final T? _dto;
  final _AdminFormStatus _status;

  AdminFormState._({
    T? dto,
    required _AdminFormStatus status,
    String? error,
    this.result,
  }) : _dto = dto,
       _status = status,
       super(error);

  final AdminModel? result;

  bool get isLoaded => _dto != null;
  bool get isLoading =>
      _status == _AdminFormStatus.loading || _dto == null;

  factory AdminFormState.initial() =>
      AdminFormState._(status: _AdminFormStatus.initial);

  AdminFormState<T> _loading() =>
      _copyWith(status: _AdminFormStatus.loading);

  AdminFormState<T> _loaded(T dto) =>
      _copyWith(dto: dto, status: _AdminFormStatus.loaded);

  AdminFormState<T> _success(AdminModel admin) =>
      _SavedAdminState(admin);

  AdminFormState<T> _error(String error) =>
      _copyWith(status: _AdminFormStatus.error, error: error);

  AdminFormState<T> _copyWith({
    T? dto,
    _AdminFormStatus? status,
    String? error,
    AdminModel? result,
  }) => AdminFormState._(
    dto: dto ?? _dto,
    status: status ?? _status,
    error: error,
    result: result ?? this.result,
  );

  onSaved(void Function(AdminModel admin) callback) {}
}

class _SavedAdminState<T extends AdminDTO> extends AdminFormState<T> {
  final AdminModel admin;

  _SavedAdminState(this.admin)
    : super._(status: _AdminFormStatus.saved, result: admin);

  @override
  onSaved(void Function(AdminModel admin) callback) =>
      callback(admin);
}
