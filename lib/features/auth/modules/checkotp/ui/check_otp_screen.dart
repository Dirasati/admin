import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/extension/snackbar.extension.dart';
import 'package:dirasaty_admin/core/shared/widgets/auth_screen.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/input_field.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/auth/config/auth_navigator.dart';
import 'package:dirasaty_admin/features/auth/modules/checkotp/logic/check_otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOtpScreen extends StatelessWidget {
  const CheckOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckOtpCubit, CheckOtpState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
        state.onSuccess((dto) {
          context.showSuccessSnackbar('CheckOtpSuccess'.tr(context));

          context.to(
            AuthNavigator.resetPassword(
              dto.emailController.text,
              dto.otpController.text,
            ),
          );
        });
      },
      child: AuthScreen(
        title: 'CheckOtp'.tr(context),
        message: 'CheckOtpMessage'.tr(context),
        form: const _Form(),
        submitButton: AppButton.secondary(
          text: 'Submit'.tr(context),
          onPressed: context.read<CheckOtpCubit>().submit,
          isLoading:
              (ctx) => ctx.select(
                (CheckOtpCubit cubit) => cubit.state.isLoading,
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
    final dto = context.read<CheckOtpCubit>().dto;
    return Form(
      key: dto.formKey,
      child: Column(
        children: [
          AppInputField(
            controller: dto.otpController,
            hintText: 'Otp'.tr(context),
            keyboardType: TextInputType.number,
            prefixIcon: AppIcons.markunread_mailbox,
            validator: (value) => dto.validateOtp(value, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton.hyperLink(
                text: 'ResendOtp'.tr(context),
                onPressed:
                    () => context.read<CheckOtpCubit>().resendOtp(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
