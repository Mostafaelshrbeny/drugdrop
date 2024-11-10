import 'package:findit/features/MainPage/domain/use_cases/check_login.dart';
import 'package:findit/features/MainPage/domain/use_cases/hive_box.dart';
import 'package:findit/features/Posts/domain/use_cases/check_connection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:findit/firebase_options.dart';
import 'package:findit/utiles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  AppHiveBox(appDocumentDirectory.path);
  await AppHiveBox.openbox("mybox");
  Widget home = await CheckUser.checkLogin();
  runApp(MyApp(home: home));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.home});
  final Widget home;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomAppTheme.darkTheme(),
          home: widget.home,
        );
      },
    );
  }
}
