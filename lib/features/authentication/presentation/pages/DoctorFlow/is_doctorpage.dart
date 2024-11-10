import 'package:findit/features/Posts/presentation/widgets/custom_button.dart';
import 'package:findit/features/authentication/presentation/Providers/AuthProvider/signup_provider.dart';
import 'package:findit/features/authentication/presentation/pages/DoctorFlow/doctor_id_page.dart';
import 'package:findit/features/authentication/presentation/pages/SignupPage/signup_page.dart';
import 'package:findit/utiles/color_helper.dart';
import 'package:findit/utiles/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class IsDoctorPage extends StatelessWidget {
  const IsDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Consumer<SignupProvider>(
              builder: (context, value, child) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Are you a Doctor or chemical?",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: ColorHelper.white),
                        ),
                        Gap(20.h),
                        Row(
                          children: [
                            Radio(
                                value: "Yes",
                                groupValue: value.isDoctor,
                                onChanged: (val) {
                                  value.setDoctor(val!);
                                }),
                            const Text("Yes"),
                            Gap(context.width / 3),
                            Radio(
                                value: "No",
                                groupValue: value.isDoctor,
                                onChanged: (val) {
                                  value.setDoctor(val!);
                                }),
                            const Text("No"),
                          ],
                        ),
                        Gap(20.h),
                        AppCustomButton(
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        ChangeNotifierProvider.value(
                                            value: value,
                                            child: value.isDoctor == "Yes"
                                                ? const DoctorIdPage()
                                                : const SignupPage())));
                          },
                          backgrondcolor: ColorHelper.buttonColor,
                          child: Text(
                            "Next ...",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: ColorHelper.white),
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }
}
