import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_pemmob/widgets/app_scaffold.dart';
import 'package:go_router/go_router.dart';
import '../config/routes.dart';
import '../provider/app_state_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _teksnama = TextEditingController();

  bool visible = false;
  @override
  void dispose() {
    _teksnama.dispose();
    super.dispose();
  }
  void _ubah() {
    setState(() {
      visible = true;
    });
  }
  @override
  Widget build (BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
        body: SingleChildScrollView(
          child: Padding(
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
                          inherit: true,
                          fontSize: screenWidth * 0.115,
                          color: Color(0xFFB5BC00),
                            shadows: [
                              Shadow(
                                  offset: Offset(-1, -1),
                                  color: Colors.black.withValues(alpha: 0.5)
                              ),
                              Shadow(
                                  offset: Offset(1, -1),
                                  color: Colors.black.withValues(alpha: 0.5)
                              ),
                              Shadow(
                                  offset: Offset(1, 1),
                                  color: Colors.black.withValues(alpha: 0.5)
                              ),
                              Shadow(
                                  offset: Offset(-1, 1),
                                  color: Colors.black.withValues(alpha: 0.5)
                              ),
                            ]
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
                      Consumer<AppStateProvider>(
                        builder: (context, provider, child) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.03),
                                    color: Colors.white

                                ),
                                child: TextField(
                                    controller: _teksnama,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "Masukkan nama Anda",

                                      hintStyle: TextStyle(
                                        color: Colors.black.withValues(
                                            alpha: 0.5),
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
                                  borderRadius: BorderRadius.circular(
                                      screenWidth * 0.05),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.2),
                                      offset: Offset(0, screenHeight * 0.005),
                                    )
                                  ],
                                ),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if(_teksnama.text != ''){
                                        final provider = Provider.of<AppStateProvider>(context, listen: false);
                                        await provider.setNama(_teksnama.text);

                                        context.go(AppRoutes.ready);
                                        provider.setNama(_teksnama.text);
                                      }
                                      else {
                                        _ubah();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFD1D1D1),
                                        shape:
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                screenWidth * 0.05)),
                                        elevation: 3,
                                        padding: EdgeInsets.all(
                                            screenWidth * 0.03)
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
                              SizedBox(height: screenHeight * 0.03),
                              Visibility(
                                visible: visible,
                                  child: Text(
                                    'Nama harus diisi',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      color: Color(0xFFFF0000)
                                    ),
                                  ))
                            ],
                          );
                        }
                      )
                    ],

                  ),


          ),
        )


    );
  }
}