import 'package:findit/features/MainPage/domain/use_cases/hive_box.dart';
import 'package:findit/utiles/cache_keys.dart';

storeUser(
    {String? user,
    required String fName,
    required String lName,
    required bool isDoctor}) {
  AppHiveBox.appBox!.put(CacheKeys.userId, user ?? "");
  AppHiveBox.appBox!.put(CacheKeys.doctor, isDoctor);
  AppHiveBox.appBox!.put(CacheKeys.userName, "$fName $lName");
}
