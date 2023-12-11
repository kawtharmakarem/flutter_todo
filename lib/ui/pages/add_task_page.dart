import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:flutter_todo_app/ui/theme.dart';
import 'package:flutter_todo_app/ui/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/task_controller.dart';
import '../widgets/button.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(Duration(minutes: 15)))
      .toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Text(
                "Add Task",
                style: headingStyle,
              )),
              InputField(
                title: 'Title',
                hint: 'Enter title here',
                controller: _titleController,
              ),
              InputField(
                title: 'Note',
                hint: 'Enter Note here',
                controller: _noteController,
              ),
              InputField(
                  title: 'Date',
                  hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                      onPressed: () => _getDateFromUser(),
                      icon: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: InputField(
                    title: 'StartTime',
                    hint: _startTime,
                    widget: IconButton(
                        onPressed: () => _getTimeFromUser(isStartTime: true),
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        )),
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: InputField(
                    title: 'EndDate',
                    hint: _endTime,
                    widget: IconButton(
                        onPressed: () => _getTimeFromUser(isStartTime: true),
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        )),
                  ))
                ],
              ),
              InputField(
                  title: 'Remind',
                  hint: '$_selectedRemind minutes early',
                  widget: Row(
                    children: [
                      DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: Colors.blueGrey,
                          underline: Container(
                            height: 0,
                          ),
                          icon: Icon(Icons.keyboard_arrow_down),
                          style: subTitleStyle,
                          iconSize: 32,
                          elevation: 4,
                          items: remindList
                              .map<DropdownMenuItem<String>>(
                                  (value) => DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(
                                        '$value',
                                        style: TextStyle(color: Colors.white),
                                      )))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedRemind = int.parse(newValue!);
                            });
                          }),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              InputField(
                title: 'Repeat',
                hint: _selectedRepeat,
                widget: Row(
                  children: [
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: Colors.blueGrey,
                      underline: Container(
                        height: 0,
                      ),
                      icon: Icon(Icons.keyboard_arrow_down),
                      style: subTitleStyle,
                      iconSize: 32,
                      elevation: 4,
                      items: repeatList
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    '$value',
                                    style: TextStyle(color: Colors.white),
                                  )))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRepeat = newValue!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPallete(),
                  MyButton(
                      label: 'Create Task',
                      onTap: () {
                        _validateDate();
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateDate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTasksToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar('required', 'All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: pinkClr,
          icon: const Icon(
            Icons.warning_amber_outlined,
            color: Colors.red,
          ));
    } else {
      print('something went wriong');
    }
  }

  _addTasksToDb() async {
    int value = await _taskController.addTask(
        task: Task(
            title: _titleController.text,
            note: _noteController.text,
            isCompleted: 0,
            date: DateFormat.yMd().format(_selectedDate),
            startTime: _startTime,
            endTime: _endTime,
            color: _selectedColor,
            remind: _selectedRemind,
            repeat: _selectedRepeat));
    print('$value');
  }

  AppBar _appBar() => AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
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
      );

  Column _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: titleStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          children: List.generate(
            3,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  radius: 14,
                  child: _selectedColor == index
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16,
                        )
                      : null,
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                          ? pinkClr
                          : orangeClr,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? _pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
              DateTime.now().add(
                Duration(minutes: 5),
              ),
            ),
    );
    String formattedTime=_pickedTime!.format(context);
    if(isStartTime)
     setState(()=> _startTime=formattedTime);
    else if(!isStartTime) 
    setState(()=> _startTime=formattedTime);
    else
     print('Something went wrong');
  }

  _getDateFromUser() async {
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2017, 9, 7, 17, 30),
        lastDate: DateTime(2030, 9, 7, 17, 30));
    if (_pickedDate != null) {
      setState(() {
        _selectedDate = _pickedDate;
      });
    } else {
      print('no selected date');
    }
  }
}
