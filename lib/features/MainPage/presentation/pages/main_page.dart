import 'package:findit/features/MainPage/data/repositories_impl/get_posts_impl.dart';
import 'package:findit/features/MainPage/presentation/blocs/navigation_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, value, child) {
        return Scaffold(
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
                        icon: Icon(Icons.medical_information), label: 'Search'),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
