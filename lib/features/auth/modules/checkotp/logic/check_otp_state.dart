// ignore_for_file: library_private_types_in_public_api

part of 'check_otp_cubit.dart';

enum _CheckOtpStatus { initial, loading, success, error }

class CheckOtpState extends ErrorState {
  final OtpDTO _dto;
  final _CheckOtpStatus _status;

  CheckOtpState({
    required OtpDTO dto,
    _CheckOtpStatus status = _CheckOtpStatus.initial,
    String? error,
  }) : _dto = dto,
       _status = status,
       super(error);

  bool get isLoading => _status == _CheckOtpStatus.loading;

  factory CheckOtpState.initial(OtpDTO dto) =>
      CheckOtpState(dto: dto);

  CheckOtpState _loading() =>
      _copyWith(status: _CheckOtpStatus.loading);

  CheckOtpState _success() =>
      _copyWith(status: _CheckOtpStatus.success);

  CheckOtpState _error(String error) =>
      _copyWith(status: _CheckOtpStatus.error, error: error);

  CheckOtpState _copyWith({
    OtpDTO? dto,
    _CheckOtpStatus? status,
    String? error,
  }) {
    return CheckOtpState(
      dto: dto ?? _dto,
      status: status ?? _status,
      error: error,
    );
  }

  //callback when success
  void onSuccess(void Function(OtpDTO dto) callback) {
    if (_status == _CheckOtpStatus.success) {
      callback(_dto);
    }
  }
}
