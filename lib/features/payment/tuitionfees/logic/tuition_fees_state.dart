part of 'tuition_fees_cubit.dart';

enum _TuitionFeesStatus { initial, loading, loaded, error }

class TuitionFeesState extends ErrorCubitState {
  final PaginationResult<TuitionFeeModel>? _result;
  final _TuitionFeesStatus _status;

  TuitionFeesState({
    PaginationResult<TuitionFeeModel>? result,
    _TuitionFeesStatus status = _TuitionFeesStatus.initial,
    String? error,
  }) : _result = result,
       _status = status,
       super(error);

  factory TuitionFeesState.initial() =>
      TuitionFeesState(status: _TuitionFeesStatus.initial);

      bool get isLoading => _status == _TuitionFeesStatus.loading;

  TuitionFeesState _copyWith({
    PaginationResult<TuitionFeeModel>? result,
    _TuitionFeesStatus? status,
    String? error,
  }) {
    return TuitionFeesState(
      result: result ?? _result,
      status: status ?? _status,
      error: error,
    );
  }

  bool isFeeLoading(TuitionFeeModel fee) => false;

  TuitionFeesState _loading() =>
      _copyWith(status: _TuitionFeesStatus.loading);

  TuitionFeesState _loadingFee(TuitionFeeModel fee) =>
      _LoadingFeeState(fee, this);

  TuitionFeesState _loaded(
    PaginationResult<TuitionFeeModel> result,
  ) => _copyWith(result: result, status: _TuitionFeesStatus.loaded);

  TuitionFeesState _error(String error) =>
      _copyWith(status: _TuitionFeesStatus.error, error: error);

  TuitionFeesState _replaceFee(TuitionFeeModel fee) {
    final result = _result ?? PaginationResult<TuitionFeeModel>();
    return _loaded(result.replace(fee));
  }
}

class _LoadingFeeState extends TuitionFeesState {
  final TuitionFeeModel? fee;
  _LoadingFeeState(this.fee, TuitionFeesState state)
    : super(status: _TuitionFeesStatus.loaded, result: state._result);

  @override
  bool isFeeLoading(TuitionFeeModel fee) => this.fee == fee;
}
