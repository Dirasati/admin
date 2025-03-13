// ignore_for_file: library_private_types_in_public_api

part of 'forgot_password_cubit.dart';

enum _ForgotPasswordStatus { initial, loading, success, error }

class ForgotPasswordState extends ErrorState {
  final ForgotPasswordDto _dto;
  final _ForgotPasswordStatus _status;

  ForgotPasswordState({
    required ForgotPasswordDto dto,
    _ForgotPasswordStatus status = _ForgotPasswordStatus.initial,
    String? error,
  }) : _status = status,
       _dto = dto,
       super(error);

  bool get isLoading => _status == _ForgotPasswordStatus.loading;

  factory ForgotPasswordState.initial() =>
      ForgotPasswordState(dto: ForgotPasswordDto());

  ForgotPasswordState _loading() =>
      _copyWith(status: _ForgotPasswordStatus.loading);

  ForgotPasswordState _success() =>
      _copyWith(status: _ForgotPasswordStatus.success);

  ForgotPasswordState _error(String error) =>
      _copyWith(status: _ForgotPasswordStatus.error, error: error);

  ForgotPasswordState _copyWith({
    ForgotPasswordDto? dto,
    _ForgotPasswordStatus? status,
    String? error,
  }) => ForgotPasswordState(
    dto: dto ?? _dto,
    status: status ?? _status,
    error: error,
  );

  void onSuccess(void Function(String email) callback) {
    if (_status == _ForgotPasswordStatus.success) {
      callback(_dto.emailController.text);
    }
  }
}
