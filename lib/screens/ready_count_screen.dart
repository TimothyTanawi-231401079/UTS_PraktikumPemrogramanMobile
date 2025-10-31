import 'package:flutter/material.dart';
import '../config/routes.dart';
import '../widgets/app_scaffold.dart';
import 'package:go_router/go_router.dart';

class ReadyCountScreen extends StatefulWidget {
  @override
  _VariableChange createState() => _VariableChange();
}

class _VariableChange extends State<ReadyCountScreen> {
  String _message = "BERSIAP";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _message = "SEDIA";
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _message = "MULAI!!";
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      context.go(AppRoutes.quiz);
    });

  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AppScaffold(
      body: Center(
        child: Text(
          _message,
          style: TextStyle(
              fontSize: screenWidth * 0.12,
            color: Color(0xFF597900)
          ),
        ),
      ),
    );
  }
}