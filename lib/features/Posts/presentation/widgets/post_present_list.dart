import 'package:findit/features/Posts/presentation/widgets/post_card.dart';
import 'package:findit/utiles/images_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PostsPresentList extends StatelessWidget {
  const PostsPresentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(
          name: posts[index]['username'] ?? "",
          body: posts[index]['postContent'] ?? "",
          imageUrl: null,
          address: posts[index]['location'],
          phoneNumber: posts[index]['phoneNumber'] ?? '',
          isVerified: false,
          comment: posts[index]['comment'],
        );
      },
      separatorBuilder: (BuildContext context, int index) => Gap(2.h),
    );
  }
}
