import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mi_vacuna/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CurpViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  final GlobalKey<FormState> formKey = GlobalKey();

  final user = {};

  showResult() {
    final curp =
        '${user['last_name'].toString().substring(0, 2).toUpperCase()}${user['surname'].toString()[0].toUpperCase()}${user['first_name'].toString()[0]}${DateFormat('yyMMdd').format(user['birth_date'])}XAXAXA00';

    _dialogService
        .showDialog(
          title: 'Resultado',
          description: 'Tu CURP es:\n$curp',
          dialogPlatform: DialogPlatform.Material,
        )
        .whenComplete(() => _navigationService.back(result: curp));
  }

  search() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();

      showResult();
    }
  }
}
