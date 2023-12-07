import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo_app/controller/task_controller.dart';
import 'package:flutter_todo_app/services/notification_services.dart';
import 'package:flutter_todo_app/services/theme_services.dart';
import 'package:flutter_todo_app/ui/pages/add_task_page.dart';
import 'package:flutter_todo_app/ui/widgets/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../size_config.dart';
import '../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
late NotificationHelper notificationHelper;
@override
  void initState() {
    super.initState();
    notificationHelper=NotificationHelper();
    notificationHelper.initializeNotification();
    notificationHelper.requestIosPermission();
    //notificationHelper.requestAndroidPermission();
  }

  DateTime _selectedDate = DateTime.now();
  final TaskController _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: _appBar(),
        body: Column(
          children: [
            _addTaskBar(),
            _addDateBar(),
            const SizedBox(
              height: 6,
            ),
            _showTasks()
          ],
        ));
  }

  AppBar _appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          ThemeServices().switchTheme();
          notificationHelper.displayNotification(
              title: 'Theme Changed', body: "Test Notification");
          NotificationHelper().scheduledNotification();
        },
        icon: Icon(
          Get.isDarkMode
              ? Icons.wb_sunny_outlined
              : Icons.nightlight_round_outlined,
          size: 24,
          color: Get.isDarkMode ? Colors.white : primaryClr,
        ),
      ),
      elevation: 0,
      backgroundColor: context.theme.colorScheme.background,

      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("images/person.jpeg"),
          radius: 20,
        ),
        const SizedBox(
          width: 20,
        )
      ],

      // leading: IconButton(
      //     onPressed: () {
      //       ThemeServices().switchTheme();
      //     },
      //     icon: Icon(Icons.light_mode_outlined)),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(_selectedDate),
                style: subHeadingStyle,
              ),
              Text(
                'Tody',
                style: headingStyle,
              ),
            ],
          ),
          MyButton(
            label: "+ Add Task",
            onTap: () async {
              await Get.to(() => AddTaskPage());
              //wait until creating task finish then getTasks
              _taskController.getTasks();
            },
          ),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10),
      child: DatePicker(
        _selectedDate,
        width: 70,
        height: 100,
        initialSelectedDate: _selectedDate,
        selectionColor: primaryClr,
        dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey)),
        dateTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey)),
        selectedTextColor: Colors.white,
        onDateChange: (newDate) {
          setState(() {
            _selectedDate = newDate;
          });
        },
      ),
    );
  }

  _showTasks() {
    return Expanded(child: _noTaskMsg());
    // return Expanded(
    //   child: Obx(() {
    //     if (_taskController.taskList.isEmpty) {
    //       return _noTaskMsg();
    //     } else {
    //       return Container(
    //         height: 0,
    //       );
    //     }
    //   }),
    // );
  }

  _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 2000),
          child: SingleChildScrollView(
            child: Wrap(
              direction: SizeConfig.orientation == Orientation.landscape
                  ? Axis.horizontal
                  : Axis.vertical,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizeConfig.orientation == Orientation.landscape
                    ? const SizedBox(
                        height: 6,
                      )
                    : const SizedBox(
                        height: 220,
                      ),
                SvgPicture.asset("images/task.svg",
                    height: 90,
                    semanticsLabel: "Task",
                    color: primaryClr.withOpacity(0.5)),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "You don't have any tasks yet! \nAdd new tasks to make your days productive",
                    style: subTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizeConfig.orientation == Orientation.landscape
                    ? const SizedBox(
                        height: 120,
                      )
                    : const SizedBox(
                        height: 180,
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}
