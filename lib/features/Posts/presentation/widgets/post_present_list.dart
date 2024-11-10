import 'package:findit/features/Posts/domain/entities/post_entity.dart';
import 'package:findit/features/Posts/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PostsPresentList extends StatelessWidget {
  const PostsPresentList({
    super.key,
    required this.posts,
  });
  final List<PostEntity> posts;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(
          name: posts[index].name,
          body: posts[index].body,
          imageUrl: posts[index].imageUrl,
          phoneNumber: posts[index].phoneNumber,
          isVerified: false,
        );
      },
      separatorBuilder: (BuildContext context, int index) => Gap(20.h),
    );
  }
}
