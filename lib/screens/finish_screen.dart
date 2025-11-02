import 'package:flutter/material.dart';
import 'package:uts_pemmob/widgets/app_scaffold.dart';
import 'package:go_router/go_router.dart';
import '../config/routes.dart';

class FinishScreen extends StatelessWidget {
  final String nama;
  const FinishScreen ({
    super.key,
    required this.nama
  });

  @override
  Widget build (BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1,
            vertical: screenHeight * 0.1
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              'SELAMAT $nama,',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  color: Colors.black
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'kamu mendapatkan nilai',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  color: Colors.black
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Container(
              width: screenWidth * 0.65,
              height: screenWidth * 0.65,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.08,
                    vertical: screenHeight * 0.09
                ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth),
                  color: Color(0xFFD9D9D9)
              ),
              child: Text(
                //TODO : Score
                '80',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.2
                ),
              )
            ),
            SizedBox(height: screenHeight * 0.025),
            Text(
              'dari 100',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  color: Colors.black
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Text(
              'Tetap Semangat!!!🔥',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  color: Colors.black
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            SizedBox(
              width: screenWidth * 0.6,
              height: screenHeight * 0.06,

              child: ElevatedButton(
                  onPressed: () {
                    context.go(AppRoutes.home);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFEE00),
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth * 0.05)),
                      elevation: 3,
                      padding: EdgeInsets.all(screenWidth * 0.01)
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'INGIN MENCOBA LAGI?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.black,
                    ),
                  )

              ),
            ),

          ],

        ),
      ),



    );
  }
}