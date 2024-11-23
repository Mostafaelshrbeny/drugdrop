import 'dart:io';
import 'package:findit/features/Posts/presentation/widgets/custom_button.dart';
import 'package:findit/features/authentication/presentation/Providers/AuthProvider/signup_provider.dart';
import 'package:findit/features/authentication/presentation/pages/SignupPage/signup_page.dart';
import 'package:findit/utiles/color_helper.dart';
import 'package:findit/utiles/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DoctorIdPage extends StatefulWidget {
  const DoctorIdPage({super.key});

  @override
  State<DoctorIdPage> createState() => _DoctorIdPageState();
}

class _DoctorIdPageState extends State<DoctorIdPage> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(builder: (context, value, child) {
      return Scaffold(
        body: pickedImage == null
            ? Center(
                child: AppCustomButton(
                margin: EdgeInsets.symmetric(
                    horizontal: 20.w, vertical: context.height / 4),
                ontap: () async {
                  final ImagePicker picker = ImagePicker();

                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    pickedImage = File(image!.path);
                  });
                },
                child: Text(
                  "Click to pick your id Image",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorHelper.white),
                ),
              ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.file(
                      pickedImage!,
                      height: 300.h,
                      width: double.infinity,
                    ),
                    Gap(20.h),
                    AppCustomButton(
                      ontap: () {
                        setState(() {
                          pickedImage = null;
                        });
                      },
                      child: const Text("Remove"),
                    ),
                    Gap(20.h),
                    AppCustomButton(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ChangeNotifierProvider.value(
                                      value: value,
                                      child: const SignupPage(),
                                    )));
                      },
                      child: const Text("Done"),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
