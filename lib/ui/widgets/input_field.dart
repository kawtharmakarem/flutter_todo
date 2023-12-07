import 'package:flutter/material.dart';
import 'package:flutter_todo_app/ui/size_config.dart';
import 'package:get/get.dart';

import '../theme.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget});
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            Container(
                height: 50,
                width: SizeConfig.screenWidth,
                padding: const EdgeInsets.only(left: 14),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: TextFormField(
                          cursorColor: Get.isDarkMode ? Colors.grey[100]:Colors.grey[700],
                      controller: controller,
                      autofocus: false,
                      readOnly: widget !=null?true:false,
                      style: subTitleStyle,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: subTitleStyle,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.colorScheme.background,
                                width: 0)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.colorScheme.background,
                                width: 0)),
                      ),
                    )),
                    widget ?? Container()
                  ],
                )),
          ],
        ));
  }
}
