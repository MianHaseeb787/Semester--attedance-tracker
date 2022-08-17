import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:semester_attendance_tracker/Screens/MainScreen.dart';
import 'package:semester_attendance_tracker/main.dart';
import 'package:semester_attendance_tracker/model/Datamodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

class OnboardingScreen extends StatelessWidget {
  final name_controller = TextEditingController();
  final semester_controller = TextEditingController();

  OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      isProgressTap: false,
      isProgress: false,
      // isBottomSafeArea: true,
      // globalBackgroundColor: Colors.black,
      // showDoneButton: true,

      showNextButton: false,
      showDoneButton: false,

      pages: [
        PageViewModel(
            decoration: PageDecoration(
                // pageColor: Colors.black,
                titleTextStyle: largeBtextstyle,
                bodyAlignment: Alignment.center,
                titlePadding: EdgeInsets.only(bottom: 10)),
            title: 'SemestO',
            // body: 'Trc',
            bodyWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register now and track your semester daily attendance with just one click",
                  style: extrasmalltextstyle,
                  textAlign: TextAlign.center,
                ),
                // Divider(
                //   thickness: 2,
                //   color: Color.fromARGB(255, 158, 156, 156),
                // ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  style: smalltextstyle,
                  controller: name_controller,
                  // keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 20),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            width: 4.0,
                            color: mainclr,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      // filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 6),
                        // borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Name',
                      labelStyle: smallBtextstyle,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      hintText: 'Enter your name',
                      hintStyle: extrasmallblacktextstyle),
                ),

                SizedBox(
                  height: 20,
                ),

                //semester text field
                TextField(
                  style: smalltextstyle,
                  controller: semester_controller,
                  // keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 20),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            width: 4.0,
                            color: mainclr,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      // filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 6),
                        // borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Semester',
                      labelStyle: smallBtextstyle,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      hintText: 'current semester number',
                      hintStyle: extrasmallblacktextstyle),
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          primary: mainclr,
                        ),
                        onPressed: () async {
                          if (name_controller.text.isEmpty ||
                              semester_controller.text.isEmpty) {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.red,
                                    title: Text("Details missing",
                                        style: smallBtextstyle),
                                    content: Text(
                                      'Please, Enter the required fields to continue',
                                      style: extrasmalltextstyle,
                                    ),
                                  );
                                });
                          }
                          var newPerson = Person(
                            name: name_controller.text,
                            semester: semester_controller.text,
                          );

                          Box<Person> person_Rec = Hive.box<Person>('person');

                          // person_Rec.add(newPerson);

                          person_Rec.put('person', newPerson);

                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('firsttime', false);

                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()));
                        },
                        child: Text(
                          "Register",
                          style: smallBtextstyle,
                        )))
              ],
            ))
      ],
    );
  }
}
