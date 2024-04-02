import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zamaan/components/custom_components.dart';
import 'package:zamaan/components/normal_button.dart';
import 'package:zamaan/data/data.dart';

import '../routes/views_route.dart';

class LoginView extends StatefulWidget {
  static String routeName = 'login-view';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
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
                isObscureText: false,
              ),

              // password input field
              CustomTextField(
                controller: passwordController,
                hintText: 'گذرواژه',
                isObscureText: true,
              ),

              // log in and go to home view
              NormalButton(
                  onPressed: () =>
                      ViewsRoute.goToSelectedView(context, view: 'home'),
                  text: 'ورود'),

              // got ot register view
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => ViewsRoute.goToSelectedView(context,
                            view: 'register'),
                        child: const Text(
                          textDirection: TextDirection.rtl,
                          'ایجاد حساب کاربری جدید.',
                          style: TextStyle(fontSize: 10),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      textDirection: TextDirection.rtl,
                      'حساب کاربری ندارید؟',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
