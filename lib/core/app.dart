import 'package:ecommerce/database/app_database.dart';
import 'package:flutter/cupertino.dart';

class App {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<AppDatabase> getDatabase() async{
    return await $FloorAppDatabase.databaseBuilder('db').build();
  }
}
