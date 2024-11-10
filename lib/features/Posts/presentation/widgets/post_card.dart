import 'package:findit/utiles/color_helper.dart';
import 'package:findit/utiles/images_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatelessWidget {
  const PostCard(
      {super.key,
      required this.name,
      required this.body,
      required this.imageUrl,
      required this.phoneNumber,
      required this.isVerified});
  final String name, body, phoneNumber;
  final int? imageUrl;
  final bool isVerified;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorHelper.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
              color: ColorHelper.black, offset: Offset(2, 4), blurRadius: 8)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الاسم : $name',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            body,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            width: double.infinity,
          ),
          Text(
            "رقم الهاتف : $phoneNumber",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          if (imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image(
                image: AssetImage(imageConst[imageUrl!]["image"] ?? ''),
                width: double.infinity,
              ),
            )
        ],
      ),
    );
  }
}
