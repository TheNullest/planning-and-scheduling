import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:zamaan/utilities/constants/text_constants.dart';

class ToastDialogConstants {
  static Widget _container(String text) => Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              width: 200,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 29, 29, 29),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: const Center(child: Text('تایید !')),
            ),
            Expanded(child: Center(child: Text(text)))
          ],
        ),
      );

  static dynamic emptyWarning(BuildContext context) => FToast.toast(
        context,
        toast: _container(TextConstants.emptyFieldsWarning),
        duration: 3000,
      );

  static dynamic passwordNotMatch(BuildContext context) => FToast.toast(
        context,
        toast: _container(TextConstants.notMatchConfirmPassword),
        duration: 3000,
      );

  static dynamic successFullPutToDB(BuildContext context) => FToast.toast(
        context,
        toast: _container(TextConstants.successFullPutToDB),
        duration: 3000,
      );

  static dynamic loginSuccessfully(BuildContext context) => FToast.toast(
        context,
        toast: _container(TextConstants.loginSuccessFull),
        duration: 3000,
      );

  static dynamic loginFailed(BuildContext context) => FToast.toast(
        context,
        toast: _container(TextConstants.loginFailed),
        duration: 3000,
      );

  static dynamic itemExistCantCreateNewer(BuildContext context) => FToast.toast(
        context,
        toast: _container(TextConstants.itemExistCantCreateNewer),
        duration: 3000,
      );
}
