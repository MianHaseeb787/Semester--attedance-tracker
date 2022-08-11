import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semester_attendance_tracker/Screens/AddCourse.dart';
import 'package:semester_attendance_tracker/constants/constants.dart';

import '../model/Datamodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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

        body: Column(
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
                      color: Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Mian Haseeb', style: largetextstyle),
                        Text('Semester # 6', style: smalltextstyle),
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

            // Container(

            //   child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Container(
            //               width: 150,
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.only(
            //                   topRight: Radius.circular(25),
            //                   bottomRight: Radius.circular(25),
            //                 ),
            //               ),
            //               child: Text('Courses',
            //                   textAlign: TextAlign.center,
            //                   style: blacksmalltextstyle),
            //             ),

            //             Container(
            //               width: 150,
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(25),
            //                   bottomLeft: Radius.circular(25),
            //                 ),
            //               ),
            //               child: Text('Absentees',
            //                   textAlign: TextAlign.center,
            //                   style: blacksmalltextstyle),
            //             ),

            //             // Text('Absentis', style: smallBtextstyle),
            //           ],
            //         ),
            // ),

            Expanded(
                flex: 4,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  addAutomaticKeepAlives: false,
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(
                            right: 80, left: 10, top: 20, bottom: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25))),
                        tileColor: Color.fromARGB(255, 21, 118, 255),
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: Icon(Icons.book),
                        title: Text(
                          data[index].courseTitle,
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                          ),
                        ),
                        trailing: Text(
                          data[index].absentee.toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    );
                  }),
                )),
          ],
        ),
        floatingActionButton: Expanded(
          child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    primary: Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  TextField(  
                    obscureText: true,  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Password',  
                      hintText: 'Enter Password',  
                    ),  
                  ),
                                ],
                              ),
                            ),
                          ),
                          
                        

                          
                          
                        );
                      }
                      );

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => AddCourse()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          ),
        ));
  }
}
