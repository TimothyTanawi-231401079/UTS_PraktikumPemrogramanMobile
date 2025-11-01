import 'package:flutter/material.dart';
import 'package:uts_pemmob/widgets/app_scaffold.dart';

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
        body: Column(

        )
    );
  }
}