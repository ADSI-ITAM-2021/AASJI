import 'package:flutter/material.dart';
import 'package:mi_vacuna/ui/views/main/main_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
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
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          color: Color(0xFFEDEDED),
          child: Container(
            width: 480,
            child: ViewModelBuilder<MainViewModel>.reactive(
              builder: (context, model, child) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    child: Container(
                      height: 64,
                      width: double.infinity,
                      color: Theme.of(context).primaryColor,
                      child: Center(
                          child: Text(
                              'Tengo 60 años cumplidos y me quiero vacunar')),
                    ),
                  ),
                  SizedBox(height: 48),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: TextEditingController()..text = model.curp,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Introduce tu CURP',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF9D0A0A),
                          ),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      textCapitalization: TextCapitalization.characters,
                    ),
                  ),
                  SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: () => model.goToForm(),
                    child: Text(
                      'Confirmar CURP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9D0A0A),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextButton(
                    onPressed: () => model.goToCurp(),
                    child: Text('Si no conoces tu CURP consultalo aquí.'),
                  ),
                  SizedBox(height: 24),
                ],
              ),
              viewModelBuilder: () => MainViewModel(),
            ),
          ),
        ),
      ),
    );
  }
}
