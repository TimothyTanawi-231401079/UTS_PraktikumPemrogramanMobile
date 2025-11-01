import 'package:flutter/material.dart';
import 'package:uts_pemmob/widgets/app_scaffold.dart';
import 'package:go_router/go_router.dart';
import '../config/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build (BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.08,
              vertical: screenHeight * 0.01
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/lamp_logo.png",
                width: screenWidth * 0.3,
                height: screenHeight * 0.3,
              ),
              Text(
                'SELAMAT DATANG DI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    color: Colors.black
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'MOBILE QUIZ',
                      textAlign: TextAlign.center,
                      style: TextStyle(

                        fontSize: screenWidth * 0.115,
                        color: Color(0xFFB5BC00)
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Berikan nama Anda sebelum memulai',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          color: Color(0xFF4C5100),

                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        color: Colors.white

                      ),
                      child: TextField(
                          textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          //TODO : Input
                        hintText: "Masukkan nama Anda",

                        hintStyle: TextStyle(
                        color: Colors.black.withValues(alpha: 0.5),
                        fontSize: screenWidth * 0.05,
                        ),
                      )
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        boxShadow: [
                          BoxShadow(
                            color : Colors.black.withValues(alpha: 0.2),
                            offset: Offset(0, screenHeight * 0.005),
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          context.go(AppRoutes.ready);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD1D1D1),
                          shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth * 0.05)),
                          elevation: 3,
                          padding: EdgeInsets.all(screenWidth * 0.03)
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          'MULAI',
                          style: TextStyle(
                            fontSize: screenWidth * 0.12,
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
