import 'package:flutter/material.dart';
import 'package:kinoshka/screens/auth_screen/auth_screen_view_model.dart';
import 'package:kinoshka/settings/app_colors.dart';
import 'package:kinoshka/settings/app_text.dart';
import 'package:kinoshka/settings/app_text_style.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              AppText.title,
              style: AppTextStyle.title,
            ),
          ),
        ),
        body: const AuthScreenBody());
  }
}

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthScreenViewModel>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              AppText.userNameLabel,
              style: AppTextStyle.authInfo,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: model.loginTextController,
              maxLines: 1,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              cursorColor: AppColors.textFieldCursor,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColors.textFieldBorderColor,
                  width: 1,
                )),
                contentPadding: EdgeInsets.all(4),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColors.textFieldBorderFocusColor,
                  width: 1,
                )),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              AppText.passwordLabel,
              style: AppTextStyle.authInfo,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: model.passwordTextController,
              maxLines: 1,
              textDirection: TextDirection.ltr,
              obscureText: true,
              cursorColor: AppColors.textFieldCursor,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.textFieldBorderColor,
                      width: 1,
                    )),
                contentPadding: EdgeInsets.all(4),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.textFieldBorderFocusColor,
                      width: 1,
                    ))),
            ),
            const SizedBox(height: 32),
            const ErrorMessageWidget(),
            Row(
              children: [
                const _AuthButtonWidget(),
                const SizedBox(width: 16),
                FilledButton(
                  onPressed: model.reset,
                  style: ButtonStyle(
                      padding:
                          const WidgetStatePropertyAll(EdgeInsets.all(4)),
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      overlayColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  child: const Text(
                    AppText.resetPasswordBtn,
                    style: AppTextStyle.loginResetBtnText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                AppText.logIn,
                style: AppTextStyle.authInfoHeader,
              ),
            ),
            const Text(
              AppText.logInInfo,
              style: AppTextStyle.authInfo,
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthScreenViewModel>();
    final onPressed =
        model.canStartAuth ? () => model.auth(context) : null;

    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(100, 40)),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 4, horizontal: 16)),
          backgroundColor:
              const WidgetStatePropertyAll(AppColors.authBtnNormal),
          overlayColor:
              const WidgetStatePropertyAll(AppColors.authBtnOverlay),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
      child: model.canStartAuth
          ? const Text(AppText.logintBtn, style: AppTextStyle.loginBtnText)
          : const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                  color: Colors.white, strokeWidth: 2),
            ),
    );
  }
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        context.select((AuthScreenViewModel value) => value.errorMessage);

    if (errorMessage == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
