import 'package:findit/features/Posts/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferDetailes extends StatelessWidget {
  const OfferDetailes(
      {super.key,
      required this.name,
      required this.body,
      required this.phoneNumber,
      required this.isVerified,
      required this.imageUrl});
  final String name, body, phoneNumber;
  final bool isVerified;
  final int imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: PostCard(
            name: name,
            body: body,
            imageUrl: imageUrl,
            phoneNumber: phoneNumber,
            isVerified: isVerified),
      ),
    );
  }
}
