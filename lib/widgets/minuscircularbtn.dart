import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:semester_attendance_tracker/main.dart';
import 'package:semester_attendance_tracker/model/Datamodel.dart';

class MinusCircularBtn extends StatelessWidget {
  Color? btn_color = Colors.white;
  IconData icon;
  Color? icon_color = Colors.black;
  Records course;
  // Function  onpres;

  MinusCircularBtn({
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
        if (course.absentee! > 0) {
          course.absentee = course.absentee! - 1;
        } else {
          course.absentee == 0;
        }
        print(course.absentee);
        // Box<Records> recBox = Hive.box<Records>('records');
        // Records.save();
        course.save();
      },
      child: Container(
        width: 27,
        height: 27,
        decoration: BoxDecoration(
            color: btn_color, borderRadius: BorderRadius.circular(25)),
        child: Icon(
          icon,
          size: 21,
          color: icon_color,
        ),
      ),
    );
  }
}
