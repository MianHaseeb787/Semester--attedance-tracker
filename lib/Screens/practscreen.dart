import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semester_attendance_tracker/constants/constants.dart';
import 'package:semester_attendance_tracker/model/Datamodel.dart';

class Pract extends StatefulWidget {
  const Pract({Key? key}) : super(key: key);

  @override
  State<Pract> createState() => _PractState();
}

class _PractState extends State<Pract> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Text('Absentees',
                              textAlign: TextAlign.center,
                              style: blacksmalltextstyle),
                        ),
                  ),
              



            ],
          ),
        ) );
  }
}


