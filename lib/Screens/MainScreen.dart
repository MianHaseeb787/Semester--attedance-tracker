import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:semester_attendance_tracker/Screens/AddCourse.dart';
import 'package:semester_attendance_tracker/constants/constants.dart';
import 'package:semester_attendance_tracker/main.dart';
import 'package:semester_attendance_tracker/widgets/minuscircularbtn.dart';

import '../model/Datamodel.dart';
import '../widgets/addcircularbtn.dart';

Person currPerson = box.get('person');

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   title: Text(
        //     "Mian Haseeb",
        //     style: largetextStyle,
        //   ),

        // ),

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      // height: 50,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 27, 26, 26),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(currPerson.name.toString(),
                              style: largetextstyle),
                          Row(
                            children: [
                              Text('Semester   ', style: smalltextstyle),
                              Text(currPerson.semester.toString(),
                                  style: smalltextstyle),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      left: 20,
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text('Courses',
                            textAlign: TextAlign.center,
                            style: blacksmalltextstyle),
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      right: 20,
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Text('Absentees',
                            textAlign: TextAlign.center,
                            style: blacksmalltextstyle),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 4,
                  child: ValueListenableBuilder<Box<Records>>(
                    valueListenable: Hive.box<Records>('records').listenable(),
                    builder: (context, box, _) {
                      return ListView.builder(
                        // itemExtent: 3,
                        physics: BouncingScrollPhysics(),
                        addAutomaticKeepAlives: false,
                        itemCount: box.values.length,
                        itemBuilder: ((context, index) {
                          Records course_cur = box.getAt(index)!;
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Dismissible(
                              // behavior: HitTestBehavior.opaque,
                              dragStartBehavior: DragStartBehavior.start,
                              background: Container(
                                color: Colors.red,
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                ),
                              ),
                              movementDuration: Duration(seconds: 1),
                              onDismissed: (direction) {
                                setState(() {
                                  box.deleteAt(index);
                                });

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      Future.delayed(
                                          Duration(milliseconds: 500), () {
                                        Navigator.of(context).pop(true);
                                      });
                                      return AlertDialog(
                                        backgroundColor: Colors.black,
                                        content: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                        title: Text(
                                          'Succesffuly deleted',
                                          style: smalltextstyle,
                                        ),
                                      );
                                    });
                              },
                              key: UniqueKey(),
                              child: ListTile(
                                  onLongPress: () {
                                    showDialog(
                                        context: context,
                                        builder: (builder) {
                                          return AlertDialog(
                                            backgroundColor: Colors.black,
                                            title: Text(
                                              'Please confirm to delete the course',
                                              style: smalltextstyle,
                                            ),
                                            actions: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: smalltextstyle,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: mainclr),
                                                  onPressed: (() {
                                                    Box<Records> Rec =
                                                        Hive.box<Records>(
                                                            'records');

                                                    Rec.deleteAt(index);
                                                    Navigator.pop(context);
                                                  }),
                                                  child: Text(
                                                    'Confirm',
                                                    style: smallBtextstyle,
                                                  )),
                                            ],
                                          );
                                        });

                                    print('object');
                                  },
                                  contentPadding: EdgeInsets.only(
                                      right: 50, left: 50, top: 20, bottom: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25),
                                          bottomRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25))),
                                  tileColor: Color.fromARGB(255, 21, 118, 255),
                                  textColor: Colors.white,
                                  iconColor: Colors.white,
                                  // leading: Icon(Icons.book),
                                  title: Text(
                                    course_cur.courseTitle!,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 25,
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MinusCircularBtn(
                                        course: course_cur,
                                        icon: Icons.remove,
                                        btn_color: Colors.white,
                                        icon_color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        course_cur.absentee.toString(),
                                        style: largetextstyle,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      AddCircularBtn(
                                        course: course_cur,
                                        icon: Icons.add,
                                        btn_color: Colors.white,
                                        icon_color: Colors.black,
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        }),
                      );
                    },
                  )),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: 200,
          height: 80,
          // padding: EdgeInsets.only(bottom: 10),
          // margin: EdgeInsets.all(10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 5.0, primary: Color.fromARGB(255, 255, 255, 255)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddCourse();
                    });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Course',
                    style: blacksmalltextstyle,
                  ),
                  Text(
                    '|',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(41, 252, 252, 252),
                      fontSize: 35,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.black,
                  )
                ],
              )),
        ));
  }
}
