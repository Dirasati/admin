part of 'dio_interceptors.dart';

class _AuthTokenInterceptor extends InterceptorsWrapper {
  // final authCacheHelper = locator<AuthCache>();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //TODO : Implement the logic to get the access token from the cache
    // final accessToken = await authCacheHelper.accessToken;

    // if (accessToken != null) {
    //   options.headers['Authorization'] = 'Bearer $accessToken';
    //   return handler.next(options);
    // }

    super.onRequest(options, handler);
  }

  _AuthTokenInterceptor._();
}
