import 'package:hive/hive.dart';

class AppHiveBox {
  static Box? appBox;
  AppHiveBox(String path) {
    Hive.init(path);
  }
  static openbox(String boxname) async {
    appBox = await Hive.openBox(boxname);
  }
}
