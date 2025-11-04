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

    final String checkbox_filled = "assets/images/checkbox.png";
    final String checkbox= "assets/images/checkbox_empty.png";
    return AppScaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.11,
              vertical: screenHeight * 0.01
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.01),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/mobile_phone.png",
                    height: screenHeight * 0.14,
                    width: screenWidth * 0.12,
                  ),
                  Text(
                    soal.id,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.1,
                    ),
                  ),
                ],
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
                              Image.asset(
                                width: screenWidth * 0.06,
                                  height: screenHeight * 0.06,
                                  selected == '1'? checkbox_filled : checkbox
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
                              Image.asset(
                                  width: screenWidth * 0.06,
                                  height: screenHeight * 0.06,
                                  selected == '2'? checkbox_filled : checkbox
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
                              Image.asset(
                                  width: screenWidth * 0.06,
                                  height: screenHeight * 0.06,
                                  selected == '3'? checkbox_filled : checkbox
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
                              Image.asset(
                                  width: screenWidth * 0.06,
                                  height: screenHeight * 0.06,
                                  selected == '4'? checkbox_filled : checkbox
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  final nomor = (index + 1).toString();
                  return SizedBox(
                    width: screenWidth * 0.095,
                    height: screenWidth * 0.095,
                    child: ElevatedButton(
                      onPressed: () => context.push('${AppRoutes.quiz}/$nomor'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0ED500),
                          shape: RoundedRectangleBorder(),
                          elevation: 3,
                          padding: EdgeInsets.all(screenWidth * 0.01)
                      ),
                      child: Text(
                        nomor,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: Colors.black
                        ),
                      ),
                    ),
                  );
                }),
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


