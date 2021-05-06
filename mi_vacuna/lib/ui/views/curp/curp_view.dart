import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mi_vacuna/ui/views/curp/curp_viewmodel.dart';
import 'package:stacked/stacked.dart';

//Vista del curp
class CurpView extends StatelessWidget {
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
        child: ViewModelBuilder<CurpViewModel>.reactive(
          builder: (context, model, child) => Form(
            key: model.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 256),
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
                              labelText: 'Nombre(s)',
                            ),
                            onSaved: (value) {
                              model.user['first_name'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Debes ingresar un tu nombre';
                              }
                            },
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
                              labelText: 'Primer Apellido',
                            ),
                            onSaved: (value) {
                              model.user['last_name'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Debes ingresar un tu primer apellido';
                              }
                            },
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
                              labelText: 'Segundo Apellido',
                            ),
                            onSaved: (value) {
                              model.user['surname'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Debes ingresar un tu segundo apellido';
                              }
                            },
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
                              labelText: 'Fecha de nacimiento',
                            ),
                            readOnly: true,
                            onTap: () async {
                              final result = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now()
                                      .subtract(Duration(days: 100 * 360)),
                                  lastDate: DateTime.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        primaryColor: Color(0xFF9d0A0A),
                                        accentColor: const Color(0xFF9d0A0A),
                                        colorScheme: ColorScheme.light(
                                          primary: const Color(0xFF9d0A0A),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  });

                              if (result != null) {
                                model.user['birth_date'] = result;
                                model.notifyListeners();
                              }
                            },
                            controller: TextEditingController(
                              text: model.user['birth_date'] != null
                                  ? DateFormat('dd/MM/yyyy')
                                      .format(model.user['birth_date'])
                                  : '',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Debes ingresar un una fecha de nacimiento';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            child: DropdownButtonFormField<String>(
                              value: model.user['gender'],
                              isExpanded: true,
                              items: ['Hombre', 'Mujer']
                                  .map((value) => DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      ))
                                  .toList(),
                              hint: Text(
                                'Sexo',
                                style: TextStyle(color: Color(0xFF9D0A0A)),
                              ),
                              onChanged: (value) {
                                model.user['gender'] = value;
                                model.notifyListeners();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Debes ingresar un tu sexo';
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 32),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            child: DropdownButtonFormField<String>(
                              value: model.user['state'],
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
                                'Estado de nacimiento',
                                style: TextStyle(color: Color(0xFF9D0A0A)),
                              ),
                              onChanged: (value) {
                                model.user['state'] = value;
                                model.notifyListeners();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Debes ingresar un tu estado de nacimiento';
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: model.search,
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
