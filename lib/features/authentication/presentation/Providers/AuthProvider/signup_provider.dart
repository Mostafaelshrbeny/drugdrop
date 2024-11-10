import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:findit/features/MainPage/domain/use_cases/store_user.dart';
import 'package:findit/features/MainPage/presentation/pages/main_page.dart';
import 'package:findit/features/Posts/domain/use_cases/app_snack_bar.dart';
import 'package:findit/features/authentication/domain/repositories/auth_repo/auth_repo.dart';
import 'package:findit/utiles/auth_errorhandel.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  bool isLoading = false;
  String result = "";
  String isDoctor = '';
  bool isPasswodVisible = true;
  bool isConfirmPasswodVisible = true;
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signup({
    required AuthRepo authrepo,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      UserCredential credential = await authrepo.signUp(
          email: mailController.text, password: passController.text);

      await userDetailes(credential.user);
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const MainPage()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      result = AuthErrorHandling.errorHandle(e);
      if (context.mounted) {
        AppSnackBar.customSnack(
            result: result,
            context: context,
            backgroundcolor: Colors.red,
            textcolor: Colors.white);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> userDetailes(User? user) async {
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'firstname': fNameController.text,
        'lastname': lNameController.text,
        'email': mailController.text,
        'isDoctor': isDoctor == "Yes",
      });
      storeUser(
          user: user.uid,
          isDoctor: isDoctor == "Yes",
          fName: fNameController.text,
          lName: lNameController.text);
    }
  }

  showpassword({required bool isConfirm}) {
    if (isConfirm) {
      isConfirmPasswodVisible = !isConfirmPasswodVisible;
    } else {
      isPasswodVisible = !isPasswodVisible;
    }

    notifyListeners();
  }

  setDoctor(String value) {
    isDoctor = value;
    notifyListeners();
  }

  @override
  void dispose() {
    mailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
