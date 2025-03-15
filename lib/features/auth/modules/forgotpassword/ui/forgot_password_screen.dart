import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/extension/snackbar.extension.dart';
import 'package:dirasaty_admin/core/shared/widgets/auth_screen.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/input_field.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/auth/config/auth_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/forgot_password_cubit.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
        state.onSuccess((email) {
          context.showSuccessSnackbar('CheckEmail'.tr(context));
          context.to(AuthNavigator.checkOtp(email));
        });
      },
      child: AuthScreen(
        title: 'ForgotPassword'.tr(context),
        message: 'ForgotPasswordMessage'.tr(context),
        form: const _Form(),
        submitButton: AppButton.secondary(
          text: 'Send'.tr(context),
          onPressed: context.read<ForgotPasswordCubit>().submit,
          isLoading:
              (ctx) => ctx.select(
                (ForgotPasswordCubit cubit) => cubit.state.isLoading,
              ),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<ForgotPasswordCubit>().dto;
    return Form(
      key: dto.formKey,
      child: Column(
        children: [
          AppInputField(
            controller: dto.emailController,
            hintText: 'Email'.tr(context),
            prefixIcon: AppIcons.email,
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            validator: (value) => dto.validateEmail(value, context),
          ),
        ],
      ),
    );
  }
}
