import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:semester_attendance_tracker/model/Datamodel.dart';

import '../constants/constants.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({Key? key}) : super(key: key);

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final TextEditingController _courseC = TextEditingController();
  final TextEditingController _absenteesC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      child: SizedBox(
        width: 400,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Add Course',
                style: smallBtextstyle,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course title :
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 5),
                    child: Text(
                      'Course Title',
                      style: extrasmalltextstyle,
                    ),
                  ),
                  TextField(
                    style: blacksmalltextstyle,
                    controller: _courseC,
                    // keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelText: 'Course',
                        labelStyle: blacksmalltextstyle,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: 'E.g. CS 101',
                        hintStyle: extrasmallblacktextstyle),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //course absentees

                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 5),
                    child: Text(
                      'Absentees',
                      style: extrasmalltextstyle,
                    ),
                  ),
                  TextField(
                    style: blacksmalltextstyle,
                    keyboardType: TextInputType.number,
                    controller: _absenteesC,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelText: 'Absentees',
                        labelStyle: blacksmalltextstyle,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: 'You can leave this blank',
                        hintStyle: extrasmallblacktextstyle),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainclr,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: () {
                      var newCourse;
                      if (_courseC.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.red,
                                title: Text("Course Title missing",
                                    style: smallBtextstyle),
                                content: Text(
                                  'Please, Enter the Course title',
                                  style: extrasmalltextstyle,
                                ),
                              );
                            });
                      } else if (_absenteesC.text.isEmpty) {
                        newCourse =
                            Records(courseTitle: _courseC.text, absentee: 0);
                      } else if (_absenteesC.text.isNotEmpty ||
                          _courseC.text.isNotEmpty) {
                        newCourse = Records(
                            courseTitle: _courseC.text,
                            absentee: int.parse(_absenteesC.text));
                      }

                      Box<Records> recBox = Hive.box<Records>('records');
                      recBox.add(newCourse);
                      _absenteesC.clear();
                      _courseC.clear();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ADD',
                      style: smallBtextstyle,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
