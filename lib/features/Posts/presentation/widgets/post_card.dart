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
      this.replacement});
  final String name, body, phoneNumber;
  final int? imageUrl;
  final String? amount, address, mediciene, replacement;
  final bool isVerified;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ColorHelper.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: double.infinity),
              if (replacement == null)
                Text(' الاسم: $name',
                    style: Theme.of(context).textTheme.titleMedium),
              if (body.isNotEmpty)
                Text(body, style: Theme.of(context).textTheme.displayMedium),
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
              if (address != null && replacement == null)
                Text("العنوان : $address",
                    style: Theme.of(context).textTheme.titleSmall),
              const Gap(10),
              if (imageUrl != null)
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image(
                        image: AssetImage(imageConst[imageUrl!]["image"] ?? ''),
                        width: double.infinity))
            ]));
  }
}
