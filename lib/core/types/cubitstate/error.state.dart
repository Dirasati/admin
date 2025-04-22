class ErrorCubitState {
  final String? _error;

  ErrorCubitState(this._error);

  void onError(void Function(String) onError) {
    if (_error != null) onError(_error);
  }
}
