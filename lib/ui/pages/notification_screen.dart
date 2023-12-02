import 'package:flutter/material.dart';
import 'package:flutter_todo_app/ui/size_config.dart';
import 'package:flutter_todo_app/ui/theme.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  final String payload;
  const NotificationScreen({super.key, required this.payload});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _payload.toString().split('|')[0],
          style: TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr),
        ),
        //by default background color for appBar is primaryswich
        elevation: 0.0,
        backgroundColor: context.theme.colorScheme.background,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                "Hello, Kawthar",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Get.isDarkMode ? Colors.white : darkGreyClr),
              ),
              SizedBox(height: 10),
              Text(
                "You have a new reminder",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: primaryClr),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.text_format,
                        size: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'title',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    _payload.toString().split('|')[0],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.description,
                        size: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    _payload.toString().split('|')[1],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(_payload.toString().split('|')[2],style: TextStyle(color: Colors.white,fontSize: 20),),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
