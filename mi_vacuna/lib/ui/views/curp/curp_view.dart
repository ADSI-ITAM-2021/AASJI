import 'package:flutter/material.dart';
import 'package:mi_vacuna/ui/views/curp/curp_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CurpView extends StatelessWidget {
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
        child: ViewModelBuilder<CurpViewModel>.reactive(
          builder: (context, model, child) => Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF9D0A0A),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF9D0A0A)),
                                border: OutlineInputBorder(),
                                labelText: 'Nombre(s)'),
                          ),
                        ),
                        SizedBox(width: 32),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF9D0A0A),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF9D0A0A)),
                                border: OutlineInputBorder(),
                                labelText: 'Primer Apellido'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF9D0A0A),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF9D0A0A)),
                                border: OutlineInputBorder(),
                                labelText: 'Segundo Apellido'),
                          ),
                        ),
                        SizedBox(width: 32),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF9D0A0A),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF9D0A0A)),
                                border: OutlineInputBorder(),
                                labelText: 'Día de nacimiento'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF9D0A0A),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF9D0A0A)),
                                border: OutlineInputBorder(),
                                labelText: 'Mes de nacimiento'),
                          ),
                        ),
                        SizedBox(width: 32),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF9D0A0A),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF9D0A0A)),
                                border: OutlineInputBorder(),
                                labelText: 'Año de nacimiento'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF9D0A0A),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF9D0A0A)),
                                border: OutlineInputBorder(),
                                labelText: 'Sexo'),
                          ),
                        ),
                        SizedBox(width: 32),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF9D0A0A),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF9D0A0A)),
                                border: OutlineInputBorder(),
                                labelText: 'Estado de nacimiento'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: model.showResult,
                          child: Text(
                            'Consultar',
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
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          viewModelBuilder: () => CurpViewModel(),
        ),
      ),
    );
  }
}
