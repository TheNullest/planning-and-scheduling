import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/constants/lottie_constants.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';
import 'package:zamaan/widgets/custom_widgets.dart';
import 'package:zamaan/routes/views_route.dart';

class RegisterView extends StatefulWidget {
  static String routeName = 'register-view';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final CustomThemeExtension myTheme = themeProvider.myTheme(context);
      return Scaffold(
        backgroundColor: myTheme.backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: myTheme.sectionBorderColor,
                  ),
                  color: myTheme.sectionColor),
              child: Column(
                children: [
                  // avatar or logo
                  Container(
                      margin: const EdgeInsets.only(bottom: 50),
                      width: 150,
                      height: 150,
                      child: Lottie.asset(LottieConstants.lottieRegistration)),

                  // UserName input field
                  CustomTextFieldWidget(
                    controller: userNameController,
                    hintText: 'نام کاربری',
                  ),

                  // phone number input field
                  CustomTextFieldWidget(
                    controller: phoneNumberController,
                    hintText: 'شماره همراه',
                    margin: const EdgeInsets.symmetric(vertical: 20),
                  ),

                  // password input field
                  CustomTextFieldWidget(
                    controller: passwordController,
                    hintText: 'گذرواژه',
                    isObscureText: true,
                  ),

                  // confirm password input field
                  CustomTextFieldWidget(
                    controller: confirmPasswordController,
                    hintText: 'تایید گذرواژه',
                    isObscureText: true,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                  ),

                  // log in and go to home view
                  CustomNormalButtonWidget(
                      onPressed: () =>
                          ViewsRoute.goToSelectedView(context, view: 'home'),
                      text: 'ایجاد حساب کاربری'),

                  // got ot login view
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomNoFieldTextButtonWidget(
                        onTap: () =>
                            ViewsRoute.goToSelectedView(context, view: 'login'),
                        name: 'حساب کاربری دارم !'),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
