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
        title: Image.network(
          'https://lh3.googleusercontent.com/proxy/RzG4z7ir2VxoWfKxfKwA02Um_tdhKr9xsRAL9S1pOtaFv-T4koIdhqpczcaRq46t5riE_fRf8-2BsNT0cUYKTpXHsM8fxtcityNBzJZTE2NfLZaNGrw',
          height: 72,
        ),
        //title: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
