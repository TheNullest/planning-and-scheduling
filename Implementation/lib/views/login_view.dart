import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/components/custom_components.dart';
import 'package:zamaan/data/data.dart';
import 'package:zamaan/themes/theme_provider.dart';

class LoginView extends StatefulWidget {
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
                  backgroundImage: AssetImage(users[2].profileImagePath),
                ),
              ),

              // UserName input field
              CustomTextField(
                  controller: userNameController,
                  hintText: 'نام کاربری',
                  isObscureText: false),

              // password input field
              CustomTextField(
                  controller: passwordController,
                  hintText: 'گذرواژه',
                  isObscureText: true),
              ElevatedButton(
                  onPressed: () => {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme()
                      },
                  child: Text(Provider.of<ThemeProvider>(context).selectedMode))
            ],
          ),
        ),
      ),
    );
  }
}
