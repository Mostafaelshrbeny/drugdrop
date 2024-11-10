import 'package:findit/features/Posts/domain/use_cases/app_snack_bar.dart';
import 'package:findit/features/Posts/presentation/widgets/app_custom_textfield.dart';
import 'package:findit/features/Posts/presentation/widgets/custom_button.dart';
import 'package:findit/features/authentication/data/repositories_impl/Auth_RepoImpl/auth_repoimpl.dart';
import 'package:findit/features/authentication/presentation/Providers/AuthProvider/signup_provider.dart';
import 'package:findit/features/authentication/presentation/pages/LoginPage/login_page.dart';
import 'package:findit/features/authentication/presentation/widgets/Auth_Widget/auth_change.dart';
import 'package:findit/features/authentication/presentation/widgets/Auth_Widget/password_filed.dart';
import 'package:findit/utiles/color_helper.dart';
import 'package:findit/utiles/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (context, value, child) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Form(
            key: value.formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              children: [
                Gap(context.height / 6),
                Text(
                  "Let's Create Account",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorHelper.white),
                ),
                Gap(30.h),
                Row(children: [
                  Expanded(
                      child: AppCustomTextField(
                          validateMsg: "Please Enter a your First Name",
                          inputType: TextInputType.emailAddress,
                          label: 'First Name',
                          fieldController: value.fNameController)),
                  Gap(10.w),
                  Expanded(
                      child: AppCustomTextField(
                          validateMsg: "Please Enter a your Last Name",
                          inputType: TextInputType.emailAddress,
                          label: 'Last Name',
                          fieldController: value.lNameController)),
                ]),
                Gap(30.h),
                AppCustomTextField(
                    validateMsg: "Please Enter a valid Email",
                    inputType: TextInputType.emailAddress,
                    label: 'Enter Your Email',
                    fieldController: value.mailController),
                Gap(30.h),
                Selector<SignupProvider, bool>(
                  selector: (_, myType) => myType.isPasswodVisible,
                  builder: (context, ispass, child) {
                    return PassWordFiled(
                      ontap: () => value.showpassword(isConfirm: false),
                      isHidden: ispass,
                      controller: value.passController,
                    );
                  },
                ),
                Gap(30.h),
                Selector<SignupProvider, bool>(
                  selector: (_, myType) => myType.isConfirmPasswodVisible,
                  builder: (context, ispass, child) {
                    return PassWordFiled(
                      ontap: () => value.showpassword(isConfirm: true),
                      isHidden: ispass,
                      controller: value.confirmPassController,
                    );
                  },
                ),
                Gap(20.h),
                Consumer<SignupProvider>(builder: (context, value, child) {
                  return AppCustomButton(
                    ontap: () {
                      if (value.formKey.currentState!.validate() &&
                          value.passController.text ==
                              value.confirmPassController.text) {
                        value.signup(
                            context: context, authrepo: AuthRepoimpl());
                      } else {
                        AppSnackBar.customSnack(
                            result: "Password doesn't match",
                            context: context,
                            backgroundcolor: Colors.red,
                            textcolor: Colors.white);
                      }
                    },
                    child: context.watch<SignupProvider>().isLoading
                        ? const CircularProgressIndicator()
                        : Text("Register",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white)),
                  );
                }),
                Gap(40.h),
                const AuthTextRich(
                  firstlabel: "Already have an account? ",
                  secondlabel: "Sign In",
                  secondPage: LoginPage(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
