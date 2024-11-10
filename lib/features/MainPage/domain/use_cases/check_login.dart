import 'package:findit/features/MainPage/data/repositories_impl/get_posts_impl.dart';
import 'package:findit/features/MainPage/presentation/blocs/navigation_provider.dart';
import 'package:findit/features/MainPage/presentation/pages/main_page.dart';
import 'package:findit/features/authentication/presentation/pages/LoginPage/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckUser {
  static checkLogin() async {
    Widget? home;
    final user = await FirebaseAuth.instance.userChanges().first;
    if (user == null) {
      home = const LoginPage();
    } else {
      home = ChangeNotifierProvider(
        create: (_) => NavigationProvider()..getData(getRepo: GetPostsImpl()),
        child: const MainPage(),
      );
    }

    return home;
  }
}
