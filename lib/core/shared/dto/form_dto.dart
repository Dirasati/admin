import 'package:flutter/widgets.dart';

mixin  FormDTO {
  final formKey = GlobalKey<FormState>();

  bool validate() => formKey.currentState!.validate();

  void dispose();

  Future<Map<String, dynamic>> toMap();
}
