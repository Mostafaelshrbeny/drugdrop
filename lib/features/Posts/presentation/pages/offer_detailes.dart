import 'package:findit/features/Posts/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferDetailes extends StatelessWidget {
  const OfferDetailes(
      {super.key,
      required this.name,
      required this.amount,
      required this.address,
      required this.phoneNumber,
      required this.isVerified,
      required this.imageUrl,
      required this.mediciene,
      this.replacement});
  final String name, amount, phoneNumber, address, mediciene;
  final bool isVerified;
  final int imageUrl;
  final String? replacement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: PostCard(
                name: name,
                replacement: replacement,
                body: '',
                amount: amount,
                mediciene: mediciene,
                address: address,
                imageUrl: imageUrl,
                phoneNumber: phoneNumber,
                isVerified: isVerified)));
  }
}
