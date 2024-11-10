import 'package:findit/features/Posts/presentation/widgets/app_custom_textfield.dart';
import 'package:findit/features/Posts/presentation/widgets/custom_button.dart';
import 'package:findit/features/authentication/data/repositories_impl/Auth_RepoImpl/auth_repoimpl.dart';
import 'package:findit/features/authentication/presentation/Providers/AuthProvider/login_provider.dart';
import 'package:findit/features/authentication/presentation/Providers/AuthProvider/signup_provider.dart';
import 'package:findit/features/authentication/presentation/pages/DoctorFlow/is_doctorpage.dart';
import 'package:findit/features/authentication/presentation/widgets/Auth_Widget/auth_change.dart';
import 'package:findit/features/authentication/presentation/widgets/Auth_Widget/password_filed.dart';
import 'package:findit/utiles/color_helper.dart';
import 'package:findit/utiles/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        builder: (context, child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Consumer(builder: (context, LoginProvider value, child) {
              return Scaffold(
                body: Form(
                  key: value.formKey,
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    children: [
                      Gap(context.height / 6),
                      Text(
                        "Let's Sign You In",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: ColorHelper.white),
                      ),
                      Gap(10.h),
                      Text("Welcome back, You've been missed",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: ColorHelper.lightGrey)),
                      Gap(30.h),
                      AppCustomTextField(
                          validateMsg: "Please Enter a valid Email",
                          inputType: TextInputType.emailAddress,
                          label: 'Enter Your Email',
                          fieldController: value.mailController),
                      Gap(30.h),
                      Selector<LoginProvider, bool>(
                        selector: (_, myType) => myType.isPasswodVisible,
                        builder: (context, ispass, child) {
                          return PassWordFiled(
                            ontap: () {
                              value.showpassword();
                            },
                            isHidden: ispass,
                            controller: value.passController,
                          );
                        },
                      ),
                      Gap(20.h),
                      AppCustomButton(
                          ontap: () {
                            if (context
                                .read<LoginProvider>()
                                .formKey
                                .currentState!
                                .validate()) {
                              value.login(
                                  context: context, authrepo: AuthRepoimpl());
                            }
                          },
                          child: context.watch<LoginProvider>().isLoading
                              ? const CircularProgressIndicator()
                              : Text(
                                  "Login",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: ColorHelper.white),
                                )),
                      Gap(40.h),
                      Center(
                        child: Text(
                          "or continue with social account",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: ColorHelper.lightGrey),
                        ),
                      ),
                      Gap(40.h),
                      AuthTextRich(
                        firstlabel: "Don't have an account? ",
                        secondlabel: "Sign Up",
                        secondPage: ChangeNotifierProvider<SignupProvider>(
                          create: (context) => SignupProvider(),
                          child: const IsDoctorPage(),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }
}
