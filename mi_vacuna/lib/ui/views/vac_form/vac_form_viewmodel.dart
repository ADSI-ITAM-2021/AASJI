import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class VacFormViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();

  var appointmentDate;

  String state = '';
  String city = '';
  String phone = '';

  save() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();

      generateAppointment();
      notifyListeners();
    }
  }

  generateAppointment() {
    appointmentDate = DateTime.now().add(Duration(days: Random().nextInt(60)));
  }
}
