import 'package:findit/features/MainPage/presentation/blocs/navigation_provider.dart';
import 'package:findit/features/Posts/presentation/pages/add_post_page.dart';
import 'package:findit/features/Posts/presentation/pages/offer_detailes.dart';
import 'package:findit/utiles/cache_keys.dart';
import 'package:findit/utiles/color_helper.dart';
import 'package:findit/utiles/context_extension.dart';
import 'package:findit/utiles/images_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(builder: (context, value, child) {
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
                    name: value.offersPosts[index].name,
                    body: value.offersPosts[index].body,
                    imageUrl: value.offersPosts[index].imageUrl ?? 0,
                    phoneNumber: value.offersPosts[index].phoneNumber,
                    isVerified: false,
                  );
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorHelper.white),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(
                              imageConst[value.offersPosts[index].imageUrl ?? 0]
                                      ["image"] ??
                                  ''),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )),
                    Gap(10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                          imageConst[value.offersPosts[index].imageUrl ?? 0]
                                  ['name'] ??
                              '',
                          style: Theme.of(context).textTheme.titleSmall),
                    )
                  ],
                ),
              )),
          itemCount: value.offersPosts.length,
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: context.height / 8, right: 8.w),
          child: FloatingActionButton(
            onPressed: () {
//AuthRepoimpl().signOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const AddPostPage(
                            postType: CacheKeys.offers,
                          )));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
