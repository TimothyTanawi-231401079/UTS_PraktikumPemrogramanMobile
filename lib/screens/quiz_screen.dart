import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_pemmob/widgets/app_scaffold.dart';

import '../config/routes.dart';
import '../data/dummy_data.dart';
import '../models/soal.dart';
import 'package:go_router/go_router.dart';

import '../provider/app_state_provider.dart';

class QuizScreen extends StatefulWidget {

  final String id;
  const QuizScreen ({
    super.key,
    required this.id
  });
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  String _teks = "LANJUT";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AppStateProvider>(context, listen: false);
      provider.setIndex(widget.id);
    });
  }
  void _ubah() {
    setState(() {
      _teks = "SELESAI";
    });
  }
  @override
  Widget build (BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final provider = Provider.of<AppStateProvider>(context);
    final id = widget.id;

    if(id == '5') _ubah();
    final selected = provider.pilihan[int.parse(id)];

    final Soal? soal = DummyData.daftar.cast<Soal?>().firstWhere(
            (soal) => soal?.id == id,
        orElse: () => null
    );
    if (soal == null) {
      return Center(
          child: Text('Soal tidak ditemukan'));
    }

    final String id1 = '1';
    final String id2 = '2';
    final String id3 = '3';
    final String id4 = '4';
    final String id5 = '5';
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
                  soal.id,
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
              //Pilihan Ganda
              SizedBox(height: screenHeight * 0.04),
              Consumer<AppStateProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      //Pilihan 1
                      GestureDetector(
                        onTap: () =>
                        {
                          provider.toggleJawaban('1')
                        },
                        child: Container(
                          constraints: BoxConstraints(minHeight: screenHeight * 0.06),
                          width: screenWidth * 0.8,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.01
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9)
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selected == '1'? Icons.check_box : Icons.check_box_outline_blank,
                                color : selected == '1'? Colors.green : Colors.white,
                              ),
                              SizedBox(
                                width: screenWidth * 0.55,
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
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      //Pilihan 2
                      GestureDetector(
                        onTap: () => {
                          provider.toggleJawaban('2')
                        },
                        child: Container(
                          constraints: BoxConstraints(minHeight: screenHeight * 0.06),
                          width: screenWidth * 0.8,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.01
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9)
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selected == '2'? Icons.check_box : Icons.check_box_outline_blank,
                                color : selected == '2'? Colors.green : Colors.white,

                              ),
                              SizedBox(
                                width: screenWidth * 0.55,
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
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      //Pilihan 3
                      GestureDetector(
                        onTap: () => {
                          provider.toggleJawaban('3')
                        },
                        child: Container(
                          constraints: BoxConstraints(minHeight: screenHeight * 0.06),
                          width: screenWidth * 0.8,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.01
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9)
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selected == '3'? Icons.check_box : Icons.check_box_outline_blank,
                                color : selected == '3'? Colors.green : Colors.white,

                              ),
                              SizedBox(
                                width: screenWidth * 0.55,
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
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      //Pilihan 4
                      GestureDetector(
                        onTap: () => {
                          provider.toggleJawaban('4')
                        },
                        child: Container(
                          constraints: BoxConstraints(minHeight: screenHeight * 0.06),
                          width: screenWidth * 0.8,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.01
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9)
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selected == '4'? Icons.check_box : Icons.check_box_outline_blank,
                                color : selected == '4'? Colors.green : Colors.white,

                              ),
                              SizedBox(
                                width: screenWidth * 0.55,
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
                      ),
                    ],
                  );
                }
            ),
              SizedBox(height: screenHeight * 0.035),
              //Tombol Soal
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.095,
                    height: screenWidth * 0.095,
                    child: ElevatedButton(
                        onPressed: () {context.push('${AppRoutes.quiz}/$id1');},
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

                    ),
                  ),
                  SizedBox(width: screenWidth * 0.075),
                  SizedBox(
                    width: screenWidth * 0.095,
                    height: screenWidth * 0.095,
                    child: ElevatedButton(
                      onPressed: () {context.push('${AppRoutes.quiz}/$id2');},
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

                    ),
                  ),
                  SizedBox(width: screenWidth * 0.075),
                  SizedBox(
                    width: screenWidth * 0.095,
                    height: screenWidth * 0.095,
                    child: ElevatedButton(
                      onPressed: () {context.push('${AppRoutes.quiz}/$id3');},
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

                    ),
                  ),
                  SizedBox(width: screenWidth * 0.075),
                  SizedBox(
                    width: screenWidth * 0.095,
                    height: screenWidth * 0.095,
                    child: ElevatedButton(
                      onPressed: () {context.push('${AppRoutes.quiz}/$id4');},
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

                    ),
                  ),
                  SizedBox(width: screenWidth * 0.075),
                  SizedBox(
            width: screenWidth * 0.095,
            height: screenWidth * 0.095,
            child: ElevatedButton(
              onPressed: () {context.push('${AppRoutes.quiz}/$id5');},
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
              )

            ),
          ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                children: [
                  id != '1' ?
                  SizedBox(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push('${AppRoutes.quiz}/${int.parse(id) - 1}');
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
                  ) : SizedBox(width: screenWidth * 0.4),
                  SizedBox(width: screenWidth * 0.08),
                  //Lanjut
                  SizedBox(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.05,
                    child: ElevatedButton(
                    onPressed: () {
                      int.parse(id) < 5 ? context.push('${AppRoutes.quiz}/${int.parse(id) + 1}')
                      : context.go(AppRoutes.finish);
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD1D1D1),
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth * 0.05)),
                      elevation: 3,
                      padding: EdgeInsets.all(screenWidth * 0.01)
                    ),
                    child: Text(
                    '$_teks ->', //TODO : Icon arrow
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


