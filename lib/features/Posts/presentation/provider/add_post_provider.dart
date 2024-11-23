import 'package:findit/features/MainPage/domain/use_cases/hive_box.dart';

import 'package:findit/features/Posts/domain/entities/post_entity.dart';
import 'package:findit/features/Posts/domain/repositories/add_post_repo.dart';
import 'package:findit/features/Posts/domain/use_cases/app_snack_bar.dart';
import 'package:findit/utiles/cache_keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddPostProvider extends ChangeNotifier {
  bool isloading = false;
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey();
  TextEditingController bodyController = TextEditingController();
  String? pickedDrug;
  int? drugImage;

  setPickedDrug({required String? drug, required int? image}) {
    pickedDrug = drug;
    drugImage = image;

    notifyListeners();
  }

  addPost({
    required AddPostRepo addpost,
    required String type,
    required BuildContext context,
  }) async {
    isloading = true;
    notifyListeners();
    try {
      await addpost.addPost(
          post: PostEntity(
              phoneNumber: phoneController.text,
              name: AppHiveBox.appBox!.get(CacheKeys.userName),
              userId: AppHiveBox.appBox!.get(CacheKeys.userId),
              imageUrl: drugImage,
              body: bodyController.text),
          type: type,
          userId: AppHiveBox.appBox!.get(CacheKeys.userId));
      if (context.mounted) {
        Navigator.pop(context);
        AppSnackBar.customSnack(
            result: "Posted Successfully",
            context: context,
            backgroundcolor: Colors.green);
      }
    } on FirebaseException catch (e) {
      if (context.mounted) {
        AppSnackBar.customSnack(
            result: e.message ?? "Something went wrong",
            context: context,
            backgroundcolor: Colors.red);
      }
    }
    isloading = false;
    notifyListeners();
  }
}
