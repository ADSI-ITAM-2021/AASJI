import 'package:flutter/material.dart';

class VacFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        toolbarHeight: 96,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/gob.png',
          height: 72,
        ),
        //title: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
