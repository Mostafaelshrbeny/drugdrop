import 'package:findit/features/Posts/data/repositories_impl/add_post_repoimpl.dart';
import 'package:findit/features/Posts/presentation/provider/add_post_provider.dart';
import 'package:findit/features/Posts/presentation/widgets/app_custom_textfield.dart';
import 'package:findit/features/Posts/presentation/widgets/custom_button.dart';
import 'package:findit/utiles/color_helper.dart';
import 'package:findit/utiles/context_extension.dart';
import 'package:findit/utiles/images_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key, required this.postType});
  final String postType;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AddPostProvider(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            forceMaterialTransparency: true,
          ),
          body: Consumer<AddPostProvider>(builder: (context, value, child) {
            return Form(
              key: value.fKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                children: [
                  Image.asset(
                    "assets/images/dragdropSplash.png",
                    height: context.height / 2.5,
                  ),
                  AppCustomTextField(
                    validateMsg: 'Please Enter Phone Number',
                    fieldController: value.phoneController,
                    label: 'Phone Number',
                  ),
                  Gap(20.h),
                  AppCustomTextField(
                    validateMsg: 'Please Enter Post Body',
                    fieldController: value.bodyController,
                    label: 'Post',
                    maxLines: 7,
                    minLines: 3,
                  ),
                  Gap(20.h),
                  AppCustomButton(
                    ontap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          context: context,
                          builder: (context) => ListView.separated(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.h, horizontal: 16.w),
                                itemBuilder: (context, index) =>
                                    AppCustomButton(
                                        backgrondcolor:
                                            ColorHelper.darkBackground,
                                        borderColor: ColorHelper.darkBackground,
                                        child: Text(
                                            imageConst[index]['name'] ?? " ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(color: Colors.white)),
                                        ontap: () {
                                          value.setPickedDrug(
                                              drug: imageConst[index]['name'],
                                              image: index);
                                          Navigator.pop(context);
                                        }),
                                separatorBuilder: (context, index) => Gap(10.h),
                                itemCount: imageConst.length,
                              ));
                    },
                    child: Text(
                        "Picked Drug : ${value.pickedDrug ?? 'Pick Drug Image'}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: ColorHelper.white)),
                  ),
                  const Gap(30),
                  AppCustomButton(
                    ontap: () async {
                      if (value.fKey.currentState!.validate()) {
                        await value.addPost(
                          context: context,
                          addpost: AddPostRepoimpl(),
                          type: postType,
                        );
                      }
                    },
                    child: value.isloading
                        ? const Center(child: CircularProgressIndicator())
                        : Text(
                            "Post",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: ColorHelper.white),
                          ),
                  )
                ],
              ),
            );
          }),
        ));
  }
}
