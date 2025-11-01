import 'package:flutter/material.dart';
import 'package:uts_pemmob/widgets/app_scaffold.dart';

import '../config/routes.dart';
import '../data/dummy_data.dart';
import '../models/soal.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends StatelessWidget {
  final String id;
  const QuizScreen ({
    super.key,
    required this.id
  });
  @override
  Widget build (BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final Soal? soal = DummyData.daftar.cast<Soal?>().firstWhere(
            (soal) => soal?.id == id,
        orElse: () => null
    );

    bool isSelected = false;
    //bool button = id == '1';
    return AppScaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.11,
              vertical: screenHeight * 0.01
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Container(
                width: screenHeight * 0.08,
                height: screenHeight * 0.08,
                padding: EdgeInsets.all(screenWidth * 0.01),
                decoration: BoxDecoration(
                  color: Color(0xFFB5BC00),
                  borderRadius: BorderRadius.circular(screenWidth * 0.5)
                ),
                child: Text(
                  soal!.id,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.1,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                soal.pertanyaan,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.black
                ),
              ),
              //TODO : Change to Widgets
              SizedBox(height: screenHeight * 0.04),
              //Pilihan 1
              Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.06,
                padding: EdgeInsets.all(screenWidth * 0.01),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9)
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //TODO : need Provider, change icon
                      },
                        icon: Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.white,),

                    ),
                    SizedBox(
                      width: screenWidth * 0.5,
                      child: Text(
                        soal.pilihan1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              //Pilihan 2
              Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.06,
                padding: EdgeInsets.all(screenWidth * 0.01),
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9)
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () { isSelected = true;},
                        icon: Icon(Icons.check_box_outline_blank, color: Colors.white,)
                    ),
                    SizedBox(
                      width: screenWidth * 0.5,
                      child: Text(
                        soal.pilihan2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: screenWidth * 0.05
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              //Pilihan 3
              Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.06,
                padding: EdgeInsets.all(screenWidth * 0.01),
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9)
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () { isSelected = true;},
                        icon: Icon(Icons.check_box_outline_blank, color: Colors.white,)
                    ),
                    SizedBox(
                      width: screenWidth * 0.5,
                      child: Text(
                        soal.pilihan3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: screenWidth * 0.05
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              //Pilihan 4
              Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.06,
                padding: EdgeInsets.all(screenWidth * 0.01),
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9)
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () { isSelected = true;},
                        icon: Icon(Icons.check_box_outline_blank, color: Colors.white,)
                    ),
                    SizedBox(
                      width: screenWidth * 0.5,
                      child: Text(
                        soal.pilihan4,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: screenWidth * 0.05
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.035),
              //TODO : Change to Widgets
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.095,
                    height: screenWidth * 0.095,
                    child: ElevatedButton(
                        onPressed: () {},
                       style: ElevatedButton.styleFrom(
                           backgroundColor: Color(0xFF0ED500),
                           shape:
                           RoundedRectangleBorder(),
                           elevation: 3,
                           padding: EdgeInsets.all(screenWidth * 0.01)
                       ),
                        child: Text(
                        '1',
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          color: Colors.black
                          ),
                        ),
                    // child: Text(
                    //   '1',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: screenWidth * 0.05,
                    //   ),

                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  SizedBox(
                    width: screenWidth * 0.095,
                    height: screenWidth * 0.095,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0ED500),
                          shape:
                          RoundedRectangleBorder(),
                          elevation: 3,
                          padding: EdgeInsets.all(screenWidth * 0.01)
                      ),
                      child: Text(
                        '2',
                        textAlign: TextAlign.center,

                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: Colors.black
                        ),
                      ),
                      // child: Text(
                      //   '1',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     fontSize: screenWidth * 0.05,
                      //   ),

                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  SizedBox(
                    width: screenWidth * 0.095,
                    height: screenWidth * 0.095,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0ED500),
                          shape:
                          RoundedRectangleBorder(),
                          elevation: 3,
                          padding: EdgeInsets.all(screenWidth * 0.01)
                      ),
                      child: Text(
                        '3',
                        textAlign: TextAlign.center,

                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: Colors.black
                        ),
                      ),
                      // child: Text(
                      //   '1',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     fontSize: screenWidth * 0.05,
                      //   ),

                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  SizedBox(
                    width: screenWidth * 0.095,
                    height: screenWidth * 0.095,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0ED500),
                          shape:
                          RoundedRectangleBorder(),
                          elevation: 3,
                          padding: EdgeInsets.all(screenWidth * 0.01)
                      ),
                      child: Text(
                        '4',
                        textAlign: TextAlign.center,

                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: Colors.black
                        ),
                      ),
                      // child: Text(
                      //   '1',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     fontSize: screenWidth * 0.05,
                      //   ),

                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  SizedBox(
            width: screenWidth * 0.095,
            height: screenWidth * 0.095,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0ED500),
                  shape:
                  RoundedRectangleBorder(),
                  elevation: 3,
                  padding: EdgeInsets.all(screenWidth * 0.01)
              ),
              child: Text(
                '5',
                textAlign: TextAlign.center,

                style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.black
                ),
              ),
              // child: Text(
              //   '1',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: screenWidth * 0.05,
              //   ),

            ),
          ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  SizedBox(
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.05,
                      child: ElevatedButton(
                        onPressed: () {
                          //context.push('${AppRoutes.quiz}/$id++');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD1D1D1),
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth * 0.05)),
                            elevation: 3,
                            padding: EdgeInsets.all(screenWidth * 0.01)
                        ),
                        child: Text(
                          '<- SEBELUMNYA', //TODO : Icon arrow
                          textAlign: TextAlign.center,

                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: screenWidth * 0.08),
                  SizedBox(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push('${AppRoutes.quiz}/$id++');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD1D1D1),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth * 0.05)),
                          elevation: 3,
                          padding: EdgeInsets.all(screenWidth * 0.01)
                      ),
                      child: Text(
                        'LANJUT ->', //TODO : Icon arrow
                        textAlign: TextAlign.center,

                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.black
                        ),
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        )
    );
  }
}
