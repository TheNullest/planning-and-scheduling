import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:zamaan/services/authentications/local_auth_service.dart';
import 'package:zamaan/utilities/themes/themes.dart';
import 'package:zamaan/utilities/constants/asset_urls/lottie_constants.dart';
import 'package:zamaan/utilities/constants/text_constants.dart';
import 'package:zamaan/views/widgets/custom_widgets.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';
import 'package:zamaan/utilities/routes/views_route.dart';

class LoginView extends StatefulWidget {
  static String routeName = 'login-view';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final CustomThemeExtension myTheme = themeProvider.myTheme(context);
      return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: myTheme.environmentColors.mainBackgroundColor,
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: myTheme.environmentColors.sectionBorderColor),
                    color: myTheme.environmentColors.sectionBackgroundColor),
                child: OverflowBar(
                  overflowAlignment: OverflowBarAlignment.center,
                  alignment: MainAxisAlignment.center,
                  overflowSpacing: 15,
                  children: [
                    // avatar or logo
                    Lottie.asset(
                      LottieConstants.lottieLogin,
                    ),

                    // UserName input field
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        children: [
                          CustomTextFieldWidget(
                            controller: _userNameController,
                            hintText: TextConstants.userNameHintTextPersian,
                          ),

                          // password input field
                          CustomTextFieldWidget(
                            controller: _passwordController,
                            hintText: TextConstants.passwordHintTextPersian,
                            isObscureText: true,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                          ),

                          // login and go to home view
                          CustomNormalButtonWidget(
                              onPressed: () async {
                                LocalAuthService().authenticateWithBiometrics(
                                    context: context);
                              },
                              text: 'ورود'),

                          // got ot register view
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: OverflowBar(
                              overflowAlignment: OverflowBarAlignment.center,
                              overflowSpacing: 10,
                              spacing: 10,
                              alignment: MainAxisAlignment.center,
                              overflowDirection: VerticalDirection.up,
                              children: [
                                CustomNoFieldTextButtonWidget(
                                    onTap: () => ViewsRoute.goToSelectedView(
                                        context,
                                        view: 'register'),
                                    name: TextConstants.askForCreateAccount),
                                const Text(
                                  textDirection: TextDirection.rtl,
                                  TextConstants.askForAccount,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
