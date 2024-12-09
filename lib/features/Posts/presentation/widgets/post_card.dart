import 'package:findit/utiles/color_helper.dart';
import 'package:findit/utiles/images_const.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PostCard extends StatelessWidget {
  const PostCard(
      {super.key,
      required this.name,
      required this.body,
      required this.imageUrl,
      required this.phoneNumber,
      required this.isVerified,
      this.amount,
      this.address,
      this.mediciene,
      this.replacement,
      this.comment});
  final String name, body, phoneNumber;
  final int? imageUrl;
  final String? amount, address, mediciene, replacement, comment;
  final bool isVerified;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        color: ColorHelper.white,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (replacement == null)
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage:
                          const AssetImage("assets/images/profile.jpg"),
                    ),
                    Text(' الاسم: $name',
                        style: Theme.of(context).textTheme.titleSmall),
                    const Spacer()
                  ],
                ),
              const Gap(5),
              if (body.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: Text(body,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium),
                ),
              const Gap(5),
              if (replacement == null)
                Text("رقم الهاتف : $phoneNumber",
                    style: Theme.of(context).textTheme.titleSmall),
              if (amount != null && replacement == null)
                Text("الكمية المتاحة : $amount",
                    style: Theme.of(context).textTheme.titleSmall),
              if (mediciene != null)
                Text("  $mediciene : اسم العقار ",
                    style: Theme.of(context).textTheme.titleSmall),
              if (replacement != null)
                Text("  $replacement : اسم البديل ",
                    style: Theme.of(context).textTheme.titleSmall),
              const Gap(5),
              if (address != null && replacement == null)
                Text("العنوان : $address",
                    style: Theme.of(context).textTheme.titleSmall),
              const Gap(10),
              if (imageUrl != null)
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image(
                        image: AssetImage(imageConst[imageUrl!]["image"] ?? ''),
                        width: double.infinity)),
              Gap(5.h),
              if (replacement == null)
                Row(
                  children: [
                    const Icon(
                      Icons.comment,
                      color: Colors.grey,
                    ),
                    const Gap(5),
                    Text(comment ?? "",
                        style: const TextStyle(color: Colors.blueGrey))
                  ],
                )
            ]));
  }
}
