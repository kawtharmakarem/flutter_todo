import 'package:flutter/material.dart';
import 'package:flutter_todo_app/services/notification_services.dart';
import 'package:flutter_todo_app/services/theme_services.dart';
import 'package:flutter_todo_app/ui/pages/home_page.dart';
import 'package:flutter_todo_app/ui/theme.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
 // NotificationHelper().initializeNotification();
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
