import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:semester_attendance_tracker/Screens/AddCourse.dart';
import 'package:semester_attendance_tracker/Screens/NewSemester_screen.dart';
import 'package:semester_attendance_tracker/constants/constants.dart';
import 'package:semester_attendance_tracker/main.dart';
import 'package:semester_attendance_tracker/widgets/minuscircularbtn.dart';

import '../model/Datamodel.dart';
import '../widgets/addcircularbtn.dart';

Person? currPerson;

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState

    currPerson = box.get('newperson');
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

        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                // flex: 1,
                // height: 200,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(left: 15, bottom: 25, top: 10),
                      // height: 50,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        color: cardblackclr,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(currPerson!.name.toString(),
                                // textAlign: TextAlign.,
                                style: mediumBtextstyle),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text("Semester  ${currPerson!.semester}",
                                    style: smalltextstyle),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 20,
                                      // fixedSize: Size(20, 5),
                                      primary: mainclr,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomLeft:
                                                  Radius.circular(25)))),
                                  onPressed: () {
                                    Box<Records> Rec =
                                        Hive.box<Records>('records');

                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return NewSemesterScreen();
                                        }));
                                  },
                                  child: Text(
                                    'New Semester',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ))
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
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text('Courses',
                              textAlign: TextAlign.center,
                              style: blacksmalltextstyle),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      right: 20,
                      child: Container(
                        width: 150,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text('Absentees',
                              textAlign: TextAlign.center,
                              style: blacksmalltextstyle),
                        ),
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
                            child: ListTile(
                                onLongPress: () {
                                  showDialog(
                                      context: context,
                                      builder: (builder) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                          backgroundColor: cardblackclr,
                                          title: Text(
                                            'Delete course',
                                            textAlign: TextAlign.center,
                                            style: smallBtextstyle,
                                          ),
                                          content: Text(
                                            'Please confirm to delete the selected course. Once deleted the course can not be recycled.',
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
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
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
                                    right: 50, left: 50, top: 12, bottom: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                        bottomRight: Radius.circular(25),
                                        bottomLeft: Radius.circular(25))),
                                tileColor: Color.fromARGB(255, 21, 118, 255),
                                textColor: Colors.white,
                                iconColor: Colors.white,

                                // leading: Icon(Icons.delete),
                                title: Text(course_cur.courseTitle!,
                                    style: mediumtextstyle),
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
                                      style: largeBtextstyle,
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
                          );
                        }),
                      );
                    },
                  )),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 80,
          // padding: EdgeInsets.only(bottom: 10),
          // margin: EdgeInsets.all(10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  elevation: 5.0,
                  primary: Color.fromARGB(255, 255, 255, 255)),
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
                    style: blacksmallBtextstyle,
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
