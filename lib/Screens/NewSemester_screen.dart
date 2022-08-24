import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:semester_attendance_tracker/constants/constants.dart';

// import '../main.dart';
import '../model/Datamodel.dart';

// Person currPerson = box.getAt(0);

class NewSemesterScreen extends StatefulWidget {
  // Person prson;
  NewSemesterScreen({
    Key? key,
    // required this.prson
  }) : super(key: key);

  @override
  State<NewSemesterScreen> createState() => _NewSemesterScreenState();
}

class _NewSemesterScreenState extends State<NewSemesterScreen> {
  TextEditingController semesterC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: cardblackclr,
      title: Text(
        'New Semester',
        textAlign: TextAlign.center,
        // textAlign: TextAlign.center,
        style: smallBtextstyle,
      ),
      content: Text(
        'Please confirm to start new semester, as all the previous data and added courses will be lost',
        textAlign: TextAlign.center,
        style: extrasmallblacktextstyle,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: extrasmalltextstyle,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: mainclr,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            onPressed: (() {
              Box<Records> Rec = Hive.box<Records>('records');
              Rec.clear();

              // Rec.deleteAt(index);
              Navigator.pop(context);
            }),
            child: Text('Confirm', style: smallBtextstyle)),
      ],
    );
  }
}
