import 'package:findit/features/MainPage/domain/repositories/get_posts_repo.dart';
import 'package:findit/features/MainPage/domain/use_cases/hive_box.dart';
import 'package:findit/features/Posts/domain/entities/post_entity.dart';
import 'package:findit/features/Posts/presentation/pages/ask_page.dart';

import 'package:findit/utiles/cache_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  List<Widget> pages = [
    const AskPostsPage(
      currentIndex: 0,
    ),
    const AskPostsPage(
      currentIndex: 1,
    ),
    const AskPostsPage(
      currentIndex: 2,
    )
  ];
  List<PostEntity> ordersPosts = [];
  List<PostEntity> offersPosts = [];
  List<PostEntity> doctorPosts = [];
  List<PostEntity> currentPosts = [];
  bool isLoading = false;
  bool hide = false;
  String currentPageType = CacheKeys.orders;
  int currentPage = 0;
  getData({required GetPostsRepo getRepo}) async {
    isLoading = true;
    notifyListeners();
    try {
      ordersPosts = await getRepo.getPosts(type: CacheKeys.orders);
      currentPosts = ordersPosts;
      offersPosts = await getRepo.getPosts(type: CacheKeys.offers);

      doctorPosts = await getRepo.getPosts(type: CacheKeys.replacement);
    } on FirebaseException catch (e) {
      print(e.message);
    }
    isLoading = false;
    notifyListeners();
  }

  navigatePage({required int index, required BuildContext context}) {
    currentPage = index;
    switch (index) {
      case 0:
        currentPageType = CacheKeys.orders;
        currentPosts = ordersPosts;
        hide = false;
        break;
      case 1:
        currentPageType = CacheKeys.offers;
        currentPosts = offersPosts;
        hide = false;
        break;
      case 2:
        currentPageType = CacheKeys.replacement;
        hide = !AppHiveBox.appBox!.get(CacheKeys.doctor);
        currentPosts = doctorPosts;
        break;
      default:
        currentPageType = CacheKeys.orders;
        currentPosts = ordersPosts;
    }
    notifyListeners();
  }
}