import 'package:findit/features/Posts/presentation/pages/add_post_page.dart';
import 'package:findit/features/Posts/presentation/pages/offer_detailes.dart';
import 'package:findit/utiles/cache_keys.dart';
import 'package:findit/utiles/color_helper.dart';
import 'package:findit/utiles/context_extension.dart';
import 'package:findit/utiles/images_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5 / 2),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return OfferDetailes(
                      name: imageConst[index]['owner'] ?? '',
                      amount: imageConst[index]['amount'] ?? '',
                      address: imageConst[index]['address'] ?? "",
                      imageUrl: index,
                      phoneNumber: imageConst[index]['phone'] ?? '',
                      isVerified: false,
                      mediciene: imageConst[index]['name'] ?? '',
                    );
                  }));
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorHelper.white),
                    child: Column(children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.grey, width: 0.8),
                            image: DecorationImage(
                                image: AssetImage(
                                    imageConst[index]["image"] ?? ''),
                                fit: BoxFit.cover),
                          ),
                          height: context.height / 7,
                          width: double.infinity),
                      const Spacer(),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(imageConst[index]['name'] ?? '',
                              style: Theme.of(context).textTheme.titleSmall)),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(imageConst[index]['amount'] ?? '',
                              style: Theme.of(context).textTheme.titleSmall)),
                      const Gap(5)
                    ]))),
            itemCount: imageConst.length),
        floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: context.height / 8, right: 8.w),
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              const AddPostPage(postType: CacheKeys.offers)));
                },
                child: const Icon(Icons.add, color: Colors.white))));
  }
}
