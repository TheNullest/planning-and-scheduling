import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/models/user_model.dart';
import 'package:zamaan/utilities/themes/themes.dart';
import 'package:zamaan/utilities/constants/asset_urls/lottie_constants.dart';
import 'package:zamaan/utilities/constants/toast_dialog_constants.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';
import 'package:zamaan/repositories/hive_repositories.dart';
import 'package:zamaan/view_models/user_view_model.dart';
import 'package:zamaan/views/widgets/custom_widgets.dart';
import 'package:zamaan/utilities/routes/views_route.dart';

class RegisterView extends StatefulWidget {
  static String routeName = 'register-view';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final CustomThemeExtension myTheme = themeProvider.myTheme(context);
      return Scaffold(
        backgroundColor: myTheme.environmentColors.mainBackgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: myTheme.environmentColors.sectionBorderColor,
                  ),
                  color: myTheme.environmentColors.sectionBackgroundColor),
              child: Column(
                children: [
                  // avatar or logo
                  Container(
                      margin: const EdgeInsets.only(
                          bottom: 50, left: 30, right: 30),
                      child: Lottie.asset(LottieConstants.lottieRegistration)),

                  // UserName input field
                  CustomTextFieldWidget(
                    controller: _userNameController,
                    hintText: 'نام کاربری',
                  ),

                  // phone number input field
                  CustomTextFieldWidget(
                    controller: _phoneNumberController,
                    hintText: 'شماره همراه',
                    margin: const EdgeInsets.symmetric(vertical: 20),
                  ),

                  // password input field
                  CustomTextFieldWidget(
                    controller: _passwordController,
                    hintText: 'گذرواژه',
                    isObscureText: true,
                  ),

                  // confirm password input field
                  CustomTextFieldWidget(
                    controller: _confirmPasswordController,
                    hintText: 'تایید گذرواژه',
                    isObscureText: true,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                  ),

                  // log in and go to home view
                  CustomNormalButtonWidget(
                    onPressed: _registerButton,
                    text: 'ایجاد حساب کاربری',
                  ),

                  // got to login view
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

  Future<void> _registerButton() async {
    UserViewModel userVM = Provider.of<UserViewModel>(context, listen: false);
    if (_userNameController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ToastDialogConstants.emptyWarning(context);
    } else if (_passwordController.text != _confirmPasswordController.text) {
      ToastDialogConstants.passwordNotMatch(context);
    } else {
      bool result = await userVM.addEntity(
        newEntity: UserModel.create(
          userName: _userNameController.text,
          password: _passwordController.text,
          firstName: 'firstName',
          lastName: 'lastName',
          birthDate: DateTime.now(),
          emailAddress: 'emailAddress',
          profileImagePath: 'profileImagePath',
        ),
        // entityExistCallback: (UserModel entity) =>
        //     entity.userName == _userNameController.text,
      );
      if (mounted) {
        if (result) {
          ToastDialogConstants.successFullPutToDB(context);
          ViewsRoute.goToSelectedView(context, view: 'login');
        } else {
          ToastDialogConstants.itemExistCantCreateNewer(context);
        }
      }
    }
  }
}
