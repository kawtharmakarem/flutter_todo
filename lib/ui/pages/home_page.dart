import 'package:flutter/material.dart';
import 'package:flutter_todo_app/services/theme_services.dart';
import 'package:flutter_todo_app/ui/widgets/button.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ThemeServices().switchTheme();
          setState(() {
            
          });
        }, icon: Icon(Get.isDarkMode ? Icons.dark_mode_outlined:Icons.light_mode_outlined)),
      ),
      body: Container(child:MyButton(label: "Add Task", onTap: (){})),
    );
  }
}