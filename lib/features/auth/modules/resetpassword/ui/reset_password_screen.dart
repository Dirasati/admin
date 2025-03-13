import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/snackbar.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/auth_screen.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/reset_password_cubit.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
        state.onSuccess(() {
          context.showSuccessSnackbar(
            'ResetPasswordSuccess'.tr(context),
          );
          //TODO go to home screen
        });
      },
      child: AuthScreen(
        title: 'ResetPassword'.tr(context),
        message: 'ResetPasswordMessage'.tr(context),
        form: const _Form(),
        submitButton: AppButton.secondary(
          text: 'Save'.tr(context),
          onPressed: context.read<ResetPasswordCubit>().submit,
          isLoading:
              (ctx) => ctx.select(
                (ResetPasswordCubit cubit) => cubit.state.isLoading,
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
    final dto = context.read<ResetPasswordCubit>().dto;
    return Form(
      key: dto.formKey,
      child: Column(
        children: [
          AppInputField.password(
            hintText: 'NewPassword'.tr(context),
            controller: dto.passwordController,
            validator:
                (value) => dto.validatePassword(value, context),
          ),
          heightSpace(26),
          AppInputField.password(
            hintText: 'ConfirmPassword'.tr(context),
            controller: dto.confirmPasswordController,
            validator:
                (value) =>
                    dto.validateConfirmPassword(value, context),
          ),
        ],
      ),
    );
  }
}
