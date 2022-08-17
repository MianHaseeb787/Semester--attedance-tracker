import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:semester_attendance_tracker/main.dart';
import 'package:semester_attendance_tracker/model/Datamodel.dart';

class AddCircularBtn extends StatelessWidget {
  Color? btn_color = Colors.white;
  IconData icon;
  Color? icon_color = Colors.black;
  Records course;
  // Function  onpres;

  AddCircularBtn({
    Key? key,
    required this.course,
    this.btn_color,
    required this.icon,
    this.icon_color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        course.absentee = course.absentee! + 1;

        print(course.absentee);
        // Box<Records> recBox = Hive.box<Records>('records');
        // Records.save();
        course.save();
      },
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
            color: btn_color, borderRadius: BorderRadius.circular(25)),
        child: Icon(
          icon,
          size: 20,
          color: icon_color,
        ),
      ),
    );
  }
}
