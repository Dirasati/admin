import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/shared/widgets/auth_screen.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/input_field.dart';
import 'package:dirasaty_admin/features/auth/config/auth_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/auth/modules/login/logic/login.cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
        // state.onSuccess(() => context.offAll(HomeNavigator())); //TODO go to home
      },
      child: AuthScreen(
        title: 'Login'.tr(context),
        message: 'LoginMessage'.tr(context),
        form: const _Form(),
        submitButton: AppButton.primary(
          text: 'Login'.tr(context),
          onPressed: context.read<LoginCubit>().login,
          isLoading:
              (ctx) => ctx.select(
                (LoginCubit cubit) => cubit.state.isLoading,
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
    final dto = context.read<LoginCubit>().state.loginDTO;
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
          heightSpace(26),
          AppInputField.password(
            controller: dto.passwordController,
            hintText: 'Password'.tr(context),
            validator:
                (value) => dto.validatePassword(value, context),
          ),
          heightSpace(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton.hyperLink(
                text: 'ForgotPassword'.tr(context),
                onPressed:
                    () => context.to(AuthNavigator.forgetPassword()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
