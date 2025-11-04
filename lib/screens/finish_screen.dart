import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_pemmob/widgets/app_scaffold.dart';
import 'package:go_router/go_router.dart';
import '../config/routes.dart';
import '../provider/app_state_provider.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen ({
    super.key,
  });

  @override
  Widget build (BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return AppScaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
              vertical: screenHeight * 0.08
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<AppStateProvider>(
              builder: (context, provider, child) {
                String? nama = provider.nama;
                return Text(
                  'SELAMAT $nama,',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      color: Colors.black
                  ),
                );
              }
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
                width: screenWidth * 0.6,
                height: screenWidth * 0.6,
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.075,
                      vertical: screenHeight * 0.085
                  ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth),
                    color: Color(0xFFD9D9D9)
                ),
                child: Consumer<AppStateProvider>(
                    builder: (context, provider, child) {
                      return Text(
                        provider.nilai().toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: screenWidth * 0.2
                        ),
                      );
                    }
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
              SizedBox(height: screenHeight * 0.02),
              Text(
                '"Kegagalan adalah syarat untuk belajar."',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.black
                ),
              ),
              SizedBox(height: screenHeight * 0.035),
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
      ),



    );
  }
}