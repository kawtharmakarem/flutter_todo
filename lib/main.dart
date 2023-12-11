import 'package:flutter/material.dart';
import 'package:flutter_todo_app/db/db_helper.dart';
import 'package:flutter_todo_app/services/theme_services.dart';
import 'package:flutter_todo_app/ui/pages/home_page.dart';
import 'package:flutter_todo_app/ui/theme.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 // NotificationHelper().initializeNotification();
await DBHelper.initDb();
 await GetStorage.init();
   runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
     theme:Themes.light,
    darkTheme: Themes.dark,
    themeMode: ThemeServices().theme,
      //home:  const NotificationScreen(payload: "part1Title|part2Description|part3Date"),
      home: HomePage(),
    );
  }
}
