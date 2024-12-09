import 'package:findit/features/MainPage/presentation/blocs/navigation_provider.dart';
import 'package:findit/features/authentication/data/repositories_impl/Auth_RepoImpl/auth_repoimpl.dart';
import 'package:findit/features/authentication/presentation/pages/LoginPage/login_page.dart';
import 'package:findit/utiles/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> titles = ['عروض', 'طلبات', 'بدائل'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Consumer<NavigationProvider>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()),
                            (route) => false);
                        AuthRepoimpl().signOut();
                      },
                      child: const Icon(Icons.logout, color: Colors.red)),
                )
              ],
              centerTitle: true,
              title: Text(
                titles[value.currentPage],
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: value.pages[value.currentPage],
            floatingActionButton: Container(
              margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorHelper.black.withOpacity(0.7),
                    offset: const Offset(2, 4),
                    blurRadius: 8,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: ColorHelper.darkBackground,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BottomNavigationBar(
                    currentIndex: value.currentPage,
                    onTap: (val) {
                      value.navigatePage(context: context, index: val);
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.info), label: 'Favourite'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.medical_information),
                          label: 'Search'),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
