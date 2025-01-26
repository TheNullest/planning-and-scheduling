import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamaan/core/common/widgets/loader.dart';
import 'package:zamaan/core/constants/app_texts.dart';
import 'package:zamaan/core/constants/routes.dart';
import 'package:zamaan/core/extensions/context_extension.dart';
import 'package:zamaan/core/extensions/int_to_space_extension.dart';
import 'package:zamaan/core/utils/navigator.dart';
import 'package:zamaan/core/utils/snackbars.dart';
import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';
import 'package:zamaan/features/auth/domain/params/user_signin_params.dart';
import 'package:zamaan/features/auth/presentation/viewmodels/auth/auth_bloc.dart';
import 'package:zamaan/features/auth/presentation/widgets/auth_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();
  final paswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    paswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailureState) {
              showSnackBar(context, state.message);
            }
            if (state is AuthSuccessState) {
              showSnackBar(context, state.user.userName);
              context.userProvider
                  .initUser(LocalUserModel.fromEntity(state.user));
              navigatorPushRemoveUntil(context, Routes.mainTaskStringRoute);
            }
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const LoaderWidget();
            }
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign In.',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  30.sizedBoxHeight,
                  AuthFieldWidget(
                    textController: emailController,
                    hintText: AppTexts.hints.email,
                  ),
                  15.sizedBoxHeight,
                  AuthFieldWidget(
                    isObsecured: true,
                    textController: paswordController,
                    hintText: AppTexts.hints.password,
                  ),
                  30.sizedBoxHeight,
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignInEvent(
                                params: UserSignInParams(
                                  email: emailController.text.trim(),
                                  password: paswordController.text.trim(),
                                ),
                              ),
                            );
                      }
                    },
                    child: const Text('Sign In'),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => navigatorPushRemoveUntil(
                        context,
                        Routes.signUpStringRoute,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: AppTexts.uiTexts.dontHaveAccount,
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
