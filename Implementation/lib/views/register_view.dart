import 'package:flutter/material.dart';
import 'package:zamaan/components/custom_components.dart';
import 'package:zamaan/data/data.dart';
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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surface),
            child: Column(
              children: [
                // avatar or logo
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(users[0].profileImagePath),
                  ),
                ),

                // UserName input field
                CustomTextField(
                  controller: userNameController,
                  hintText: 'نام کاربری',
                ),

                // phone number input field
                CustomTextField(
                  controller: phoneNumberController,
                  hintText: 'شماره همراه',
                  margin: const EdgeInsets.symmetric(vertical: 20),
                ),

                // password input field
                CustomTextField(
                  controller: passwordController,
                  hintText: 'گذرواژه',
                  isObscureText: true,
                ),

                // confirm password input field
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: 'تایید گذرواژه',
                  isObscureText: true,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                ),

                // log in and go to home view
                CustomNormalButton(
                    onPressed: () =>
                        ViewsRoute.goToSelectedView(context, view: 'home'),
                    text: 'ایجاد حساب کاربری'),

                // got ot login view
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomNoFieldTextButton(
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
  }
}
