import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findit/features/MainPage/domain/use_cases/store_user.dart';
import 'package:findit/features/MainPage/presentation/pages/main_page.dart';
import 'package:findit/features/Posts/domain/use_cases/app_snack_bar.dart';
import 'package:findit/features/authentication/domain/repositories/auth_repo/auth_repo.dart';
import 'package:findit/utiles/auth_errorhandel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isPasswodVisible = true;
  TextEditingController passController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String result = '';
  Future<void> login({
    required AuthRepo authrepo,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      UserCredential credential = await authrepo.signIn(
        email: mailController.text,
        password: passController.text,
      );
      await getUserDetails(credential);
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

  getUserDetails(UserCredential credential) async {
    QuerySnapshot data = await FirebaseFirestore.instance
        .collection("users")
        .where(credential.user!.uid)
        .get();

    storeUser(
        user: credential.user!.uid,
        isDoctor: data.docs.first['isDoctor'],
        fName: data.docs.first['firstname'],
        lName: data.docs.first['lastname']);
  }

  showpassword() {
    isPasswodVisible = !isPasswodVisible;
    notifyListeners();
  }

  @override
  void dispose() {
    mailController.dispose();
    passController.dispose();

    super.dispose();
  }
}
