part of 'dio_interceptors.dart';

class _AuthTokenInterceptor extends InterceptorsWrapper {
  final authCacheHelper = locator<AuthCache>();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await authCacheHelper.accessToken;

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      
      
    }

    super.onRequest(options, handler);
  }

  _AuthTokenInterceptor._();
}
