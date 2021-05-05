import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mi_vacuna/ui/views/vac_form/vac_form_viewmodel.dart';
import 'package:stacked/stacked.dart';

class VacFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VacFormViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(128),
          child: Form(
            key: model.formKey,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Datos Geográficos',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: 500,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: DropdownButtonFormField<String>(
                            //value: model.user['state'],
                            isExpanded: true,
                            items: [
                              'Aguascalientes',
                              'Baja California',
                              'Baja California Sur',
                              'Campeche',
                              'Coahuila',
                              'Colima',
                              'Chiapas',
                              'Chihuahua',
                              'Ciudad de México',
                              'Durango',
                              'Guanajuato',
                              'Guerrero',
                              'Hidalgo',
                              'Jalisco',
                              'México',
                              'Michoacán',
                              'Morelos',
                              'Nayarit',
                              'Nuevo León',
                              'Oaxaca',
                              'Puebla',
                              'Querétaro',
                              'Quintana Roo',
                              'San Luis Potosí',
                              'Sinaloa',
                              'Sonora',
                              'Tabasco',
                              'Tamaulipas',
                              'Tlaxcala',
                              'Veracruz',
                              'Yucatán',
                              'Zacatecas'
                            ]
                                .map((value) => DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    ))
                                .toList(),
                            hint: Text(
                              'Estado',
                              style: TextStyle(color: Color(0xFF9D0A0A)),
                            ),
                            onChanged: (value) {
                              model.state = value ?? '';
                              model.notifyListeners();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Debes ingresar un tu estado';
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: 500,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: DropdownButtonFormField<String>(
                            //value: model.user['state'],
                            isExpanded: true,
                            items: [
                              'Estado',
                            ]
                                .map((value) => DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    ))
                                .toList(),
                            hint: Text(
                              'Municipio / Alcaldía',
                              style: TextStyle(color: Color(0xFF9D0A0A)),
                            ),
                            onChanged: (value) {
                              model.city = value ?? '';
                              model.notifyListeners();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Debes ingresar un tu Municipio / Alcaldía';
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 64),
                        Text(
                          'Datos de Contacto',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: 500,
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
                              labelText: 'Teléfono celular',
                            ),
                            onSaved: (value) {
                              model.phone = value ?? '';
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Debes ingresar un tu celular';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: model.appointmentDate == null
                        ? Container(
                            width: 210,
                            child: ElevatedButton(
                              onPressed: () => model.save(),
                              child: Text(
                                '¿Cuándo me toca vacunarme?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
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
                            ))
                        : Text(
                            'Tu cita será el día ${DateFormat('dd/MM/yyyy hh:mm').format(model.appointmentDate)}\nFolio: F636289',
                            style: TextStyle(fontSize: 36),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => VacFormViewModel(),
    );
  }
}
