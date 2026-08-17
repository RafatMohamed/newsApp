import 'package:hive_flutter/hive_flutter.dart';
import '../../consts/app_const.dart';


class StorgeThemLocalHive {
  StorgeThemLocalHive._internal();
  static final StorgeThemLocalHive instance = StorgeThemLocalHive._internal();
  factory StorgeThemLocalHive() {
    return instance;
  }

  Future<void> initSharedMain() async {
    await Hive.initFlutter();
    await Hive.openBox<bool>(AppConst.themLocalName);
  }

  static final Box<bool> boxThemMode = Hive.box<bool>(
    AppConst.themLocalName,
  );

  Future<void> saveThemLocal({required bool isDark}) async {
    await boxThemMode.put(AppConst.themLocalKey, isDark);
  }

  bool getThemLocal() {
    final result = boxThemMode.get(AppConst.themLocalKey);
    return result ?? false;
  }
}
