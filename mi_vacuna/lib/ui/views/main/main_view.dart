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
        title: Image.asset(
          'assets/images/gob.png',
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
              builder: (context, model, child) => Form(
                key: model.formKey,
                child: Column(
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
                      child: TextFormField(
                        controller: TextEditingController(text: model.curp),
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
                        onSaved: (value) {
                          model.curp = value ?? '';
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 18) {
                            return 'Debes introducir un curp válido';
                          }
                        },
                        textAlign: TextAlign.center,
                        textCapitalization: TextCapitalization.characters,
                      ),
                    ),
                    SizedBox(height: 48),
                    ElevatedButton(
                      onPressed: model.validateCurp,
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
              ),
              viewModelBuilder: () => MainViewModel(),
            ),
          ),
        ),
      ),
    );
  }
}
