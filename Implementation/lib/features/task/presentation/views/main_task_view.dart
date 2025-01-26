import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamaan/core/common/cubits/user/app_user_cubit.dart';
import 'package:zamaan/core/config/themes/app_dark_palette.dart';
import 'package:zamaan/core/extensions/context_extension.dart';

class MaintTaskView extends StatefulWidget {
  const MaintTaskView({super.key});

  @override
  State<MaintTaskView> createState() => _MaintTaskViewState();
}

class _MaintTaskViewState extends State<MaintTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MainTask'),
        leading: IconButton(
          onPressed: () => context.read<AppUserCubit>().signOutUser(context),
          icon: const Icon(Icons.logout),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.currentUser!.userName,
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
              onPressed: () =>
                  context.read<AppUserCubit>().signOutUser(context),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
