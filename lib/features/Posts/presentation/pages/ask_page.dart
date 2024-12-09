import 'package:findit/features/MainPage/data/repositories_impl/get_posts_impl.dart';
import 'package:findit/features/MainPage/presentation/blocs/navigation_provider.dart';
import 'package:findit/features/Posts/presentation/pages/add_post_page.dart';
import 'package:findit/features/Posts/presentation/widgets/post_present_list.dart';

import 'package:findit/utiles/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AskPostsPage extends StatelessWidget {
  const AskPostsPage({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(builder: (context, value, child) {
      return RefreshIndicator(
          onRefresh: () async {
            await value.getData(getRepo: GetPostsImpl());
            if (context.mounted) {
              value.navigatePage(index: currentIndex, context: context);
            }
            return;
          },
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.startFloat,
                  body: SafeArea(
                      child: value.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white))
                          : const PostsPresentList()),
                  floatingActionButton: value.hide
                      ? null
                      : Padding(
                          padding: EdgeInsets.only(
                              bottom: context.height / 8, right: 8.w),
                          child: FloatingActionButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AddPostPage(
                                            postType: value.currentPageType)));
                              },
                              child: const Icon(Icons.add,
                                  color: Colors.white))))));
    });
  }
}
