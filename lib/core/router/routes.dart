part of 'router.dart';

abstract class AppRoutes {
  static const _authPaths = [
    '/login',
    '/signup',
    '/forget-password',
    '/check-otp',
    '/reset-password',
    '/verify-account',
  ];

  static const String home = '/home';

  //* AUTH ROUTES
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forget-password';
  static const String checkOtp = '/check-otp';
  static const String resetPassword = '/reset-password';
  static const String verifyAccount = '/verify-account';

  //* STUDENT ROUTES
  static const String students = '/students';

  //* CLASS ROUTES
  static const String classes = '/classes';
  static const String classDetails = '/classes/:id';

  //* TEACHER ROUTES
  static const String teachers = '/teachers';


}
