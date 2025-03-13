// ignore_for_file: library_private_types_in_public_api

part of 'reset_password_cubit.dart';

enum _ResetPasswordStatus { initial, loading, success, error }

class ResetPasswordState extends ErrorState {
  final NewPasswordDTO _dto;
  final _ResetPasswordStatus _status;

  ResetPasswordState({
    required NewPasswordDTO dto,
    _ResetPasswordStatus status = _ResetPasswordStatus.initial,
    String? error,
  }) : _status = status,
       _dto = dto,
       super(error);

  bool get isLoading => _status == _ResetPasswordStatus.loading;

  factory ResetPasswordState.initial(NewPasswordDTO dto) =>
      ResetPasswordState(dto: dto);

  ResetPasswordState _loading() =>
      _copyWith(status: _ResetPasswordStatus.loading);

  ResetPasswordState _success() =>
      _copyWith(status: _ResetPasswordStatus.success);

  ResetPasswordState _error(String error) =>
      _copyWith(status: _ResetPasswordStatus.error, error: error);

  ResetPasswordState _copyWith({
    NewPasswordDTO? dto,
    _ResetPasswordStatus? status,
    String? error,
  }) => ResetPasswordState(
    dto: dto ?? _dto,
    status: status ?? _status,
    error: error,
  );

  void onSuccess(void Function() callback) {
    if (_status == _ResetPasswordStatus.success) {
      callback();
    }
  }
}
